---
title: InSpec
developer: Chef
type: software
category: testing/functional
tags: software/InSpec dev/testing dev/testing/functional
docs: https://docs.chef.io/inspec/
visibility: public
---
Chef InSpec provides a framework for functional testing.

InSpec tests consists of so-called controls, which in our case represent a set of tests for a certain puppet module. They should be put in `our-modules/$module/files/controls` and have the file extension `.rb`. As with the Puppet language the language for InSpec controls and the framework are ruby-esk.

Templates are supported here, so Hiera data is available through look-ups of the form
```ruby
scope['module::key']            # for single-valued keys and
scope['module::key']['sub-key'] # for elements of a multi-valued item
```

To run InSpec tests directly on a machine it can be installed through (see https://docs.chef.io/inspec/install/#linux)
```bash
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```
Note that running `inspec exec` as above might result in an error, as InSpec is expecting a specific folder structure for what they call a `profile` (see https://docs.chef.io/inspec/profiles/, shortened here to the minimum):
```
examples/profile
├── controls
│   └── control.rb
└── inspec.yml
```
That means it might be necessary to create a sub-directory `/var/lwp/inspec_controls/controls` and move the `.rb` files there. Then running
```bash
inspec exec /var/lwp/inspec_controls/ --chef-license=accept-silent --reporter cli html:/some/directory/inspec_results.html
```
should be possible.

InSpec `exec` exit codes are (see https://docs.chef.io/inspec/cli/#exec)
```
    0  normal exit, all tests passed
    1  usage or general error
    2  error in plugin system
    3  fatal deprecation encountered
  100  normal exit, at least one test failed
  101  normal exit, at least one test skipped but none failed
  172  chef license not accepted
```

Chef themselves offer free basic courses on their [website](https://learn.chef.io/tracks).


## Controls

InSpec controls have their own ruby-esk [Chef InSpec Language](https://docs.chef.io/inspec/dsl_inspec/) and a [style guide](https://docs.chef.io/inspec/style/). The keyword `it` refers to the resource itself and `its` specifies the resource's values. For a example a [`file_resource`](https://docs.chef.io/inspec/resources/file/) can have value corresponding to its ownership, permissions and content.

Resources work by comparing resource values to expectations through [matchers](https://docs.chef.io/inspec/matchers/). These compare (in-)equality, similarity (through regular expressions) and more.

Similar to puppet a lot (more than 500) of ["resources"](https://docs.chef.io/inspec/resources/) exist, that facilitate specific tests. A more specific example is the resource [`sshd_config_resource`](https://docs.chef.io/inspec/resources/sshd_config/).


### Remote testing

Can be run on a remote machine using SSH by specifying a target:
```bash
inspec exec /var/lwp/inspec --key-files $HOME/.ssh/id_rsa --target ssh://root@remote --chef-license=accept-silent --reporter cli html:/root/inspec_results.html
```
But of course there are some caveats as some of the tests rely on being run directly on the machine and/or command output might differ when run through SSH.