<h2>YouTube Channels / Video Material</h2>
<p>
  <a href="https://www.youtube.com/watch?v=vBreXjkizgo&t=2376s">Vagrant introduction</a><br>
  <a href="https://blog.scottlowe.org/2016/01/18/multi-machine-vagrant-json/">About vagrant.json</a><br>
  <a href="https://www.youtube.com/watch?v=sjV4JdAw-Vs">Tutorial 1 part1</a><br>
  <a href="https://www.youtube.com/watch?v=X8iC5Q5lKLg">Tutorial 1 part2 </a><br>
  
  <p>Project Setup</p>
  <pre>
  $ mkdir vagrant_getting_started
  $ cd vagrant_getting_started
  $ vagrant init hashicorp/precise64
  </pre>
  
<h2>Vagrantfile (vagrant up) with sintax in Ruby but not used</h2>
<p>
  describe the type of virtual machine<br>
  one vagrantfile per project comited to version control<br>
  You can change the starting directory where Vagrant looks for a Vagrantfile by setting the VAGRANT_CWD environmental variable to some other path.<br>
</p> 
  
  <pre>
  Vagrant.configure("2") do |config|
  # v2 config...
  #line2
  Vagrant.require_version ">= 1.3.5", "< 1.4.0"
  #line3
  #config.vm.box_version = "20190206.0.0"
  #config.vm.box_url = "https://app.vagrantup.com/ubuntu/boxes/trusty64"
  #line4
  config.vm.post_up_message ="Your VM is know done and you can enter in by using vagrant ssh"
  #line5  
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end  
  end
  </pre>
<p>  
    #line1 "2" represents the version of the configuration object used for block configuration(section between do and end)<br>
    "2" represents the configuration for 1.1+ leading up to 2.0.x <br>
    only a single "config" version can be used or we can mix them e.g. if you found some useful configuratuon snippet <br>
    <br>
    #line2 Minimum vagran version 
    <a href="https://www.vagrantup.com/docs/vagrantfile/tips.html">create three machines</a><br>
    <a href="https://www.vagrantup.com/docs/vagrantfile/machine_settings.html">machine settings</a><br>
    <br>
    #line5 configure multiple providers. "virtualbox" is the name providet being configured<br>
        inside is a inner block with custom configuration to configurate the provider<br>
 </p>
    <pre>
    Vagrant.configure("2") do |config|
      #line1
      config.vm.box = "precise64"
      config.vm.provider "vmware_fusion" do |v, override|
        override.vm.box = "precise64_fusion"
      end
    end
    </pre>
<p>
  In the above case, Vagrant will use the "precise64" box by default, but will use "precise64_fusion" if the VMware Fusion provider is used.
  #line1 will automatically downoad and add the box when it is run
</p>
  
<h3>Vagrant comands</h3>
<pre>
#boot the agrant
$ vagrant up
#drop you into a full-fledged SSH session. Close SSH session can be done with CTRL+D
$ vagrant ssh
# vagrant will terminate the use of any resources by the VM
# To completely remove the box file, you can use the vagrant box remove command
$ vagrant destroy
$ vagrant reload
</pre>

<h3>Synced folders</h3>
With synced folders, you can continue to use your own editor on your host machine and have the files sync into the guest machine.<br>
