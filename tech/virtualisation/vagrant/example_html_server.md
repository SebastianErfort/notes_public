## HTML server

See <https://developer.hashicorp.com/vagrant/tutorials/networking-provisioning-operations/getting-started-provisioning>

In working dir with Vagrantfile, create dir `html` with file `index.html`

```html
<!DOCTYPE html>
<html>
  <body>
    <h1>Get started with Vagrant!</h1>
  </body>
</html>
```

Create provisioning script `bootstrap.sh` with content

```bash
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
```

assuming Debian family OS, installing Apache and sym-linking synced Vagrant directory and Apache content directory to be served.

Edit Vagrantfile to use provisioning script

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :shell, path: "bootstrap.sh"
end
```

Start up and verify, for example on VM `vagrant@vagrant:~$ wget -qO- 127.0.0.1`
