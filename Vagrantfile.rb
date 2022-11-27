# -*- mode: ruby -*-
# vi: set ft=ruby :

# Команды подсмотрены отсюда https://developer.hashicorp.com/vagrant/docs/vagrantfile/machine_settings

Vagrant.configure("2") do |config|

  config.vm.box = "jammy"
  
  # Обновления не проверять
  config.vm.box_check_update = false
  
  # Задать синх папок, но отключить
  config.vm.synced_folder "C://{directory}//important", "/importante", disabled: true

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
      vb.gui = false
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "1024"
  end
  
  config.vm.hostname = "learnthelesson"
  config.vm.define "learnthelesson"
  
  # Таймаут загрузки — две секунды, запуститься не успеет, зато видно, что настройка работает
  config.vm.boot_timeout = 2
  
  # Приветственное сообщение (видно, если изменить таймаут, конечно)
  config.vm.post_up_message = "Hey, I'm up"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2
  SHELL

end
