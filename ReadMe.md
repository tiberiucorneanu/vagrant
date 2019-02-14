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
  
<h2>Vagrantfile (vagrant up) with sintax in Ruby but not used<h2>
<p>
  describe the type of virtual machine<br>
  one vagrantfile per project comited to version control<br>
  You can change the starting directory where Vagrant looks for a Vagrantfile by setting the VAGRANT_CWD environmental variable to some other path.<br>
</p> 
  
  <pre>
  Vagrant.configure("2") do |config|
  # v2 config...
  Vagrant.require_version ">= 1.3.5", "< 1.4.0"
  end
  </pre>
    
<p>  
    in line 1 "2" represents the version of the configuration object used for block configuration(section between do and end)<br>
    "2" represents the configuration for 1.1+ leading up to 2.0.x <br>
    only a single "config" version can be used or we can mix them e.g. if you found some useful configuratuon snippet <br>
    <br>
    in line 2 Minimum vagran version 
    <a href="https://www.vagrantup.com/docs/vagrantfile/tips.html">create three machines</a><br>
    <a href="https://www.vagrantup.com/docs/vagrantfile/machine_settings.html">machine settings</a><br>
</p>
  

