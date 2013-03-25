# Basic Raybeam Vagrant Box

This is a very basic Vagrant box developed as a foundation for Raybeam projects.  It includes:

* build-essential
* redis
* postgres + header files
* mysql + header files

## Installation

1. Get [Vagrant][http://docs.vagrantup.com/v2/getting-started/index.html]

1. Spin up the box
```
vagrant up
```

## Configuration

A very basic configuration is already available.  You could actually just work off of that, but the things you'll probably want to change are:

### Vagrantfile

1. The VM name
Default: rb_base

```
['modifyvm', :id, '--name',         'rb_base']
```

1. The shared directory location on the VM
Default: /bi/rb_base

```
config.vm.share_folder 'vshared', '/bi/rb_base', '.', :extra => 'dmode=770,fmode=770'
```

1. The setup procedure
I have a really simple shell provisioner for this box.  It's instructions from a blank lucid32 box are in setup.sh.

