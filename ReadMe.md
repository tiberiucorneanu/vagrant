<p><b>Youtube </b><a href="https://www.youtube.com/watch?v=jj6gJ8ulsiM&list=PLLhEJK7fQIxCBqSuBhph22GTeq7HHdxB5">de urmarit o sa mai posteze</a></p>    

[api vagrant?](https://searchitoperations.techtarget.com/tutorial/Create-Vagrant-boxes-with-Packer-for-rapid-IT-environment-builds)   
[legatura intre json si vagrant cu un simplu exemplu](https://blog.scottlowe.org/2016/01/18/multi-machine-vagrant-json/)    
learn tools vagrant git [repo](https://github.com/scottslowe/learning-tools/tree/master/vagrant)
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
$ vagrant reload
#to exit from VM and go to host machine
$ exit
<br>
#save the current running state of the machine and stop it
#vagrant up will resumed from where you left off
#fast but still eats up my disk space
$vagrant suspend
#shut down the guest. will cleanly shut down your machine, preserving the contents of disk but it take extra time to start and also consume disk space
$vagrant halt
#vagrant will terminate the use of any resources by the VM
#To completely remove the box file, you can use the vagrant box remove command
$ vagrant destroy
#
$ vagrant box outdated
$ vagrant box update
</pre>

<h3>Synced folders</h3>
With synced folders, you can continue to use your own editor on your host machine and have the files sync into the guest machine.<br>

<h3>Provisioning</h3>
<pre>
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
</pre>

<pre>
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision :shell, path: "bootstrap.sh"
  #line1
  config.vm.network :forwarded_port, guest: 80, host: 4567
end
</pre>
<p>
to reload the vagrant call "$ vagrant reload --provision" which will restart the VM skipping the initial import step<br>
you cannot see the website from your own browser yet, for this you need networking
</p>

<h3>Networking</h3>
<p>
we have a web server up and running with the ability to modify files from our host and have them automatically synced to the guest<br>
networrking feature will give us additional option for accessing the machine from our host machine.<br>
#line1 <b>Potr forwarding</b> specify ports on the guest machine to share via a port to the host machine.<br>
Once the machine is running again, load http://127.0.0.1:4567 in your browser. You should see a web page that is being served from the virtual machine that was automatically setup by Vagrant.

<h3>Vahrant Share ???</h3>
<p><a href="https://www.youtube.com/watch?v=eSxTRhMIoz8">Make your package.bok file</a> and share your virtualbox dev env<br>
https://dashboard.ngrok.com/get-started    <br>
https://www.yeahhub.com/install-use-ngrok-complete-guide-2018/ <br>
https://vimeo.com/87525972 <br>
</p>
<pre> 
$ vagrant pugin install vagrant-share
</pre>
</p>

<h3>Box File</h3>
<p>
metadata.json  is only one per box file, whereas whereas one catalog metadata JSON document can describe multiple versions of the same box, potentially spanning multiple providers.<br>
metadata.json must contain at least the <b>"provider"</b> using this to verify the provider of the box
no metadata.json or the JSON is invalid with no "provider" key => ERROR
<pre>
{
  "provider": "virtualbox"
}
</pre>
</p>

<h3>Box info</h3>
<p>
by running <b>$ vagrant box list -i</b> you can see aditional info<br>
&nbsp; &nbsp; &nbsp; &nbsp; brian@localghost % vagrant box list -i<br>
&nbsp; &nbsp; &nbsp; &nbsp; hashicorp/precise64     (virtualbox, 1.0.0)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   - author: brian<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  - homepage: https://www.vagrantup.com<br>
</p>

