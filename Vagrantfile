Vagrant::Config.run do |config|
  config.vm.box = 'rb_base'
  config.vm.box_url = 'https://s3.amazonaws.com/raybeam.public/rb_base.box'

  [
    ['modifyvm', :id, '--name',         'rb_base'],
    ['modifyvm', :id, '--memory',       512],
    ['modifyvm', :id, '--vram',         4],
    ['modifyvm', :id, '--cpus',         1],
    ['modifyvm', :id, '--pae',          'on'],
    ['modifyvm', :id, '--hwvirtex',     'on'],
    ['modifyvm', :id, '--nestedpaging', 'on'],
    ['modifyvm', :id, '--acpi',         'on'],
  ].each do |option|
    config.vm.customize option
  end

  config.vm.share_folder 'vshared', '/bi/rb_base', '.', :extra => 'dmode=770,fmode=770'

  config.vm.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root',   '1']
  config.vm.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/vshared',  '1']
  config.vm.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]

  config.vm.network :hostonly, '33.33.33.10'

  config.vm.provision :shell, :path => 'setup.sh'
end
