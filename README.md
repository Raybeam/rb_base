# Basic Raybeam Vagrant Box

This is a very basic Vagrant box developed as a foundation for Raybeam projects.  It includes:

* build-essential
* redis
* postgres + header files
* mysql + header files

This box is far from complete.  Please raise issues with things you'd like to see or, better yet, add it yourself and create a pull request.

## Installation

1. Get [Vagrant](http://docs.vagrantup.com/v2/getting-started/index.html)

1. Spin up the box
```
vagrant up
```

## Configuration

A very basic configuration is already available.  You could actually just work off of that, but the things you'll probably want to change are:



###The VM name

*Default: rb_base*

*Vagrantfile*

```
['modifyvm', :id, '--name',         'rb_base']
```

###The shared directory location on the VM

*Default: /bi/rb_base*

*Vagrantfile*

```
  config.vm.share_folder 'vshared', '/bi/rb_base', '.', :extra => 'dmode=770,fmode=770'
```

###Change the provisioning instructions
See setup.sh below for more info

*Default: setup.sh shell provisioner*

*Vagrantfile*

```
config.vm.provision :shell, :path => 'setup.sh'
```

## setup.sh
This is a really simple shell provisioner for this box.  It's instructions for how this box was built from a blank lucid32 box.
It's set not to take a bunch of time installing things that are already there, but you actually don't need it at all.  

You should really just delete the entire setup.sh file and use it to add libraries or configurations that you need.  You could
also just do away with the shell provisioning line in the Vagrantfile altogether and switch to chef-solo or something.

## Contributing

1. Clone this
2. If you make changes to the setup.sh file, make sure you've tested it
3. Make sure installations that take a long time don't run if they're already present
4. Create a pull request
5. Once I've built the VM and uploaded it, I'll merge the pull request

