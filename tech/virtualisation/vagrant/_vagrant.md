---
title: Vagrant
website: "https://www.vagrantup.com/"
source: "https://github.com/hashicorp/vagrant"
code: open source
company: Hashicorp
type: software
category:
  - virtualisation
visibility: public
---
# Vagrant

`= ("[Website](" + this.website + ")")` |  `= ("[GitHub](" + this.source + ")")`

Working directory is shared with VM, accessible under `/vagrant`.

## Commands

```bash
vagrant init hasicorp/bionic64 # create Vagrantfile for specified box
vagrant status # show status of current environment's VMs
vagrant global-status # show status of all Vagrant VMs
vagrant up # boot up box
vagrant ssh # SSH into VM
vagrant halt # attempt gracious shutdown
vagrant destroy # delete a VM
vagrant help commands # list available commands
vagrant box list
vagrant box add
vagrant box remove
vagrant up --provider=vmware_desktop # use specified provider, no changes to Vagrantfile necessary. Following commands should use the same, no need to specify again
```

## Provisioning

<https://developer.hashicorp.com/vagrant/docs/provisioning>
Happens

- at first `vagrant up`, after only if `--provision` is set
- when running `vagrant provision`
- calling `vagrant reload --provision`

## Vagrantfile

Written in [[ruby]] language

```ruby
Vagrant.configure("2") do |config|
  # specify box to use, see
  config.vm.box = "hashicorp/bionic64"

  config.vm.provision :shell, path: "bootstrap.sh"
  # or
  config.vm.provision "shell", inline: "echo Starting provisioning..."
  # or named and ruby-esk
  config.vm.provision "bootstrap", type: "shell" do |s|
    s.inline = "echo hello"
  end

  config.vm.network :forwarded_port, guest: 80, host: 4567 # port forwarding

  # specify sync folder, see https://developer.hashicorp.com/vagrant/docs/synced-folders/basic_usage
  config.vm.synced_folder "src/", "/srv/website"
end
```

with provisioning script `bootstrap.sh`. Reload after editing, `vagrant reload`.

Vagrant also supports *linked clones*, providing significant savings in disk space, see [this article](https://medium.com/oracledevs/two-birds-with-one-home-cloned-vagrant-multi-machines-2ee5ba75fad8).


## Controlling Machines

- SSH private key in `./.vagrant/machines/default/<hypervisor>/private_key`


## Boxes

- Documentation
    - [Boxes > Creating a Base Box](https://developer.hashicorp.com/vagrant/docs/boxes/base)
    - [Providers > VirtualBox > Creating a Base Box](https://developer.hashicorp.com/vagrant/docs/providers/virtualbox/boxes)
- [softwaretester.info: Create private vagrant box repository](https://softwaretester.info/create-private-vagrant-box-repository/)

[Package](https://developer.hashicorp.com/vagrant/docs/cli/package)
Package a box for reuse. **This didn't work the way I expected, the packages box didn't include additional packages I had installed on the parent machine.** ^15d863

```bash
vagrant package [--base NAME]
## --base NAME  package a VirtualBox machine VirtualBox manages instead
vagrant box add mybox /path/to/my.box
```

#### Repository

[Create private Vagrant box repository](https://softwaretester.info/create-private-vagrant-box-repository/)

1. set up [[nginx]] on (virtual) machine

    ```bash
    # install epel-release and nginx
    systemctl enable nginx
    systemctl start nginx
    mkdir -p /var/www/html/devops/vagrant/boxes
    chmod -R 755 /var/www/html/devops/
    touch /var/www/html/devops/vagrant/mybox.json
    sha1sum /var/www/html/devops/vagrant/boxes/mybox.box
    # edit JSON file
    # edit nginx config
    nginx -t # check nginx config
    systemctl restart nginx
    ```

## Examples

- [[example_html_server|HTML server]]
