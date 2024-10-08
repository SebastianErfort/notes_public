---
title: Puppet
tags:
  - dev/cm/puppet
  - dev/configurationmanagement
  - dev/CM
visibility: public
docs: "https://www.puppet.com/docs/puppet/7/puppet_index.html"
up:
  - "[[_configuration_management]]"
---
# Puppet

`=("[Documentation](" + this.docs + ")")`

- [[#Resources]]
    - [[#^exec|Exec]]
    - [File Resource](https://puppet.com/docs/puppet/7/types/file.html)
    - [Package Resource](https://puppet.com/docs/puppet/7/types/package.html)
- [Conditionals](https://puppet.com/docs/puppet/7/lang_conditional.html)
    - [selector expressions](https://puppet.com/docs/puppet/7/lang_conditional.html#lang_condition_selector)
- [[#Variables]]
    - [Hashes](https://puppet.com/docs/puppet/7/lang_data_hash.html)
- [Built-in function reference](https://puppet.com/docs/puppet/7/function.html)
- Programs
    - `agent`: [man page](https://www.puppet.com/docs/puppet/7/man/agent.html)

General

- Desired State Configuration (DSC)
- Idempotency


## Puppet language

### Resources

![[puppet_resource_structure.png]]

- [Meta-parameters](https://www.puppet.com/docs/puppet/7/metaparameter.html): pre-defined attributes that work with any resource type
- [Resource Types](https://www.puppet.com/docs/puppet/7/resource_types.html) ^resources
    - [File](https://www.puppet.com/docs/puppet/7/types/file.html) ^file
    - [Exec](https://www.puppet.com/docs/puppet/7/types/exec.html) ^exec
    - [Service](https://www.puppet.com/docs/puppet/7/types/service.html) ^service
    - [`Package`](https://puppet.com/docs/puppet/7/types/package.html) ^package
        - doesn't support #linux/snap [see](https://tickets.puppetlabs.com/browse/PUP-7435) other than through a community/Forge module <https://forge.puppet.com/modules/rootexpert/snap>
    - [`ensure_packages`](https://doc.wikimedia.org/puppet/puppet_functions_ruby3x/ensure_packages.html)
    - [Exported Resources](https://www.puppet.com/docs/puppet/7/lang_exported.html)
- [Puppet Forge](): community modules with varying quality
    - [apt][puppet-forge-apt]
    - [recursive_file_permissions](https://forge.puppet.com/modules/npwalker/recursive_file_permissions/readme) (even suggested in Puppet's docs)

Puppet URI: `puppet://<server>/<mount point>/<path>` (better syntax for hosted files available)

Resource defaults

```puppet
# capital letter
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}
# or better in some ways (e.g. scope)
file {
  default:
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    ensure => file
  ;
  '/etc/motd':
    source => 'puppet:///modules/defaults/motd'
  ;
}
```

#### Dependencies

There are mutiple ways to declare dependencies between resources to ensure they are run in a certain order. With newer version Puppet should also adhere to the order in which resources are stated in the manifest. This can save code repetition if many resources depend on one resource or the other way around.

```Puppet
## direct sequential dependency
file { 'resource1': }
~> exec { 'resource2': }
## from earlier resource to later
file { 'resource1':
  notify => [Exec['resource2'], Service['resource3']],
}
exec { 'resource2': }
service { 'resource3': }
## from later resource to earlier
file { 'resource1': }
service { 'resource2':
  require => File['resource2'],
}
```

#### File

file sources


```puppet
file { '/etc/motd':
  ensure => file,
  source => 'puppet:///modules/modulname/directory/motd.txt'
}
```


### Classes

Simple abstraction, really a way of naming a block of code to be used elsewhere.

Example

```puppet
# class definition
class motd {
  file { 'Message of the day':
    path    => '/etc/motd',
    ensure  => file,
    content => 'Keep calm and carry on.',
  }
}

# class declaration/instance
class { 'motd':
  ensure => present,
}
```

Often classes are scoped and they can have (type-enforced) parameters, e.g.

```puppet
class profile::motd (
  String $message = 'Default message',
) inherits profile::params {
  file { 'motd':
    path    => '/etc/motd',
    ensure  => file,
    content => $message,
  }
}
```

Inheritance in Puppet is messy and only parameters should be set like this.


### Variables

- immutable, no re-assignment

Syntax example

```puppet
$some_name = 'Bob' # single quotes as muhc as possible
$some_greeting = "Hello ${some_name}" # variable for string interpolation
# selector: variable assignment
$default_editor = $facts['os']['family'] ? {
  'Linux'   => 'vim',
  'Windows' => 'notepad',
  default   => 'nano',
}
```


### Logic and Comparators

```puppet
if $some_boolean {

} else {

}
# inverted if
unless $another_boolean {

} else {

}
# selector: match multiple values
case $some_name {
  'bob': { include basic }
  'carol', 'ben': { include expert }
  'sue': { include regular }
}
```


## Iterators

```puppet
# each: array/hash values to variable(s)
['carol', 'bob', 'alice'].each |$username| {
    user { $username:
    home       => "/var/www/${username}",
    managehome => true,
  }
}
{
  'bob' => '/home/bob_burger',
  'alice' => '/var/rabbit_hole',
  'tina' => '/srv/justice',
}.each |$username, $homedir| {
  # ...
}
# see also map and filter
```


### Functions

Examples

```puppet
# template functions
file { '/etc/motd':
  content => epp('motd/message.epp', {message => 'Welcome!'})
}
# lookup parameters from Hiera
$userlist = lookup('profile::admin_users::users')
user { $userlist:
  ensure => present,
}
```


### Logging

Examples: <https://stackoverflow.com/a/16671685>
*Notify resource*

```puppet
notify { "My message: variable = $variable": }
```

<details><summary>Different Puppet log level functions</summary>

```puppet
node default {
  notice("try to run this script with -v and -d to see difference between log levels")
  notice("function documentation is available here: http://docs.puppetlabs.com/references/latest/function.html")
  notice("--------------------------------------------------------------------------")

  debug("this is debug. visible only with -d or --debug")
  info("this is info. visible only with -v or --verbose or -d or --debug")
  alert("this is alert. always visible")
  crit("this is crit. always visible")
  emerg("this is emerg. always visible")
  err("this is err. always visible")
  warning("and this is warning. always visible")
  notice("this is notice. always visible")
  #fail will break execution
  fail("this is fail. always visible. fail will break execution process")

}
```

</details>
<center><a href="https://i.stack.imgur.com/gdRjh.png">
<img src="https://i.stack.imgur.com/gdRjh.png" alt="different log levels colors" style="zoom:80%">
</a></center>

### Strings

Operations can be performed on strings using Puppet's builtin functionalities. For example

- `strip`: trim whitespace left and right (including newline characters)
- `l/rstrip`: trim whitespace left __or__ right

Most of these also work within variable substitution `${var}`, such as `${var.strip}`.

## Data and Parameters: Facter and Hiera

[Hiera, data and Puppet code: your path to the right data decisions @Puppet blog](https://puppet.com/blog/hiera-data-and-puppet-code-your-path-right-data-decisions/)

### Facter

[Facter](https://puppet.com/docs/puppet/7/facter.html) | [Custom facts](https://puppet.com/docs/puppet/7/custom_facts.html)

Puppet uses Facter to collect various information on the system and provides them as "facts".
> Facter is Puppet’s cross-platform system profiling library. It discovers and reports per-node facts, which are available in your Puppet manifests as variables.

Can be used to display OS and system information. To show data as available in Puppet, use `puppet facts`, e.g. `$facts['os']['release']['major']`.

- [Executing shell commands in facts](https://puppet.com/docs/puppet/7/custom_facts.html#executing_shell_commands_in_facts)
- [Confining facts](https://puppet.com/docs/puppet/7/custom_facts.html#configuring_facts-confining-facts): for example to certain OSs
- Facts can be created as well
- Facts can be specified as command line environment variables, for example

    ```bash
    FACTER_timeout=0 puppet agent -t
    ```

- determine value of fact and debug

    ```puppet
    puppet facts --verbose --debug <your_fact>
    ```

[Remco's Ruby tutorial including Puppet facts](file://edu/ruby/remco/programming-in-ruby/Ruby%20Session4.ipynb)


### Hiera

[Documentation](https://puppet.com/docs/puppet/7/hiera.html) | [Hiera config](https://puppet.com/docs/puppet/7/hiera_config_yaml_5.html)
Hiera works like a pyramid and the higher up a data layer is, the higher its priority. At the top is usually node-level data, that can overwrite profile/role/lower data such as defaults.

- The main file for this is the file `hiera.yaml` in the base of the repository.
- Hierarchy between modules is usually set in a file `common.yaml`, e.g. `data/99_config.yaml`. The section `profile::config:` contains the different sets of `modules` to be used in our different profiles
    - `base`: common to all profiles
    - ...
    - `server`: modules for servers
- The order of modules within one of these sets is important, if there are dependencies! For example a module `sshd` might use data from the module `mfa` and has thus to come after/below it
- on top of that we might have node-level files (`<node>.yaml`), e.g. in `data/00_hosts/`, role-assignments by IP-ranges in `data/10_roles` as well as external node classifiers (ENCs, see next section).


### External Node Classifiers (ENCs)

[Puppet documentation on ENCs](https://www.puppet.com/docs/puppet/7/nodes_external.html)

ENCs allow us to assign roles to machines by building, room, hostname, ...


### Lookup

Hiera data can be accesses through a "look-up", using the `lookup` function. A hiera data element in `moduleA.yaml` with content

```yaml
moduleA::config: value
```

for example can be accessed in module B through `lookup('moduleA::config.value')`, see the [Puppet documentation](https://puppet.com/docs/puppet/7/hiera_automatic.html#access_hash_array-elements_keysubkey_notation).

### Template files

[Documentation](https://puppet.com/docs/puppet/5.5/lang_template.html) | [EPP](https://puppet.com/docs/puppet/5.5/lang_template_epp.html) | [ERB](https://puppet.com/docs/puppet/5.5/lang_template_erb.html)
In a template file (within hiera/yaml) there are several ways

- `yaml` style: `aliased_key: "%{lookup('other_key.\"dotted.subkey\"')}"`
- `.erb` (ruby template) style: `scope['mfa::enable']`
- `.epp` (puppet template) style: `$mfa.enabl`

Mind when puppet does the variable substitution though. To use hiera data within a template that is stored in hiera data again one might have to use `@var`. Also there's a zoo of different ways to achieve the same here. Sometimes the syntax is `$array['key']`, in other contexts it might be `$array[key]` without ticks, etc.

### Examples

[[rug/lwp/Puppet/Puppet|Work notes LWP: Puppet]]

## Config

Change default environment (branch): edit `/etc/puppetlabs/puppet/puppet.conf`

```ini
[main]
server = fqdn.puppet.master
ca_server = fqdn.puppet.ca

[agent]
environment = my_branch
```

## Documentation

Documentation of self-written modules can be automatically created if certain formats for comments and descriptions are used, see [Puppet Strings](https://www.puppet.com/docs/puppet/7/puppet_strings.html).

Using [Puppet Strings](https://www.puppet.com/docs/puppet/7/puppet_strings.html#available-strings-tags) it is possible to automatically create Markdown documentation: requires certain format for module headers, then run `puppet strings generate --format markdown`

- [Publish to GitHub Pages](https://www.puppet.com/docs/puppet/6/puppet_strings.html#puppet_strings_github_pages)

## Modules, Puppet Forge

- [apt module](https://forge.puppet.com/modules/puppetlabs/apt) | [Github](https://github.com/puppetlabs/puppetlabs-apt)
- [debconf community module](https://forge.puppet.com/modules/stm/debconf)

## Testing

- linting and syntax
    - `puppet-lint`
        - [list of checks and how to ignore them](http://puppet-lint.com/checks/)
        - [control comments](http://puppet-lint.com/controlcomments/) can be used in the code to ignore problems, even give reasons
        - `puppet-lint --show-ignored`
        - `puppet-lint --fix`: fixes problems found by `puppet-lint`
        - can also be invoked by `rake lint`
    - `rake syntax`: syntax check Puppet manifests and templates
    - `puppet parser validate`
    - `yamllint`: syntax, validity and style check for YAML files

- `rake`: puppet module testing
    - list commands with `rake -T` (has to have Rakefile)
    - will ensure correct ruby gem versions, similar to/using(?) `bundle`

- unit and integration
    - `rspec-puppet`
        - install: `gem install rspec-puppet puppetlabs_spec_helper rspec-puppet-facts`
        - for modules/classes created with PDK all necessary files and a basic test file should exist
        - run in module base directory: `rspec spec/dir/module_name.rb`
        - should be run using `rake spec` as other puppet testing facilities
    - `beaker`: puppet tool running code on a VM (vagrant, Docker, etc.)
        - uses a nodeset (VMs) defined e.g. in [`modulename/spec/acceptance/nodesets/default.yml`](file:///home/erfort/edu/puppet/LL_Puppet_EssT/elk/spec/acceptance/nodesets/default.yml)
- acceptance and manual testing:
    - module-specific scripts
        - usually in `_module_/files/tests`, see e.g. `icaclient`
        - tests can be run by executing `/var/tests/run_tests`
    - `beaker`: puppet's own

- Puppet Development Kit (PDK)
    - `pdk new module` creates a new module in the style of puppet forge modules, that means a lot of stuff we don't need
    - `pdk new class` creates a new (empty) class as a template in `manifests/init.pp` and `spec/classes/bla_spec.rb`
    - creates a file `.travis.yaml` for building with CI service Travis
        - works only with Github public repositories in the free version
        - Travis will request permissions from Github and once set up provide a pipeline for testing similar to GitLab etc.
