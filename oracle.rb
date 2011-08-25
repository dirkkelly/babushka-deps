dep "oracle instant client" do
  met? {
    Dir.exists?  "/opt/oracle/instantclient"
    if File.exists? "/opt/oracle/instantclient/sdk/BASIC_README"
      shell("cat /opt/oracle/instantclient/sdk/BASIC_README").include?("32-bit")
      shell("cat /opt/oracle/instantclient/sdk/BASIC_README").include?("11.2.0.2.0")
    end
  }
  meet {
    shell "mkdir -p ~/tmp"
    shell "cd ~/tmp"
    shell "curl http://csapc1.murdoch.edu.au/babushka-deps/instantclient_11_2-x86.tar > ~/tmp/instantclient_11_2-x86.tar"
    shell "tar -xvf ~/tmp/instantclient_11_2-x86.tar ~/tmp/instantclient_11_2-x86"
    shell "rm ~/tmp/instantclient_11_2-x86.tar"
    sudo  "mkdir -p /opt/oracle/x86/"
    sudo  "rm /opt/oracle/instantclient"
    sudo  "mv ~/tmp/instantclient_11_2 /opt/oracle/x86/"
    sudo  "ln -s /opt/oracle/x86/instantclient_11_2 /opt/oracle/instantclient"
  }
end