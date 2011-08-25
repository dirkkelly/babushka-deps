dep "oracle instant client" do
  met? {
    shell("cat /opt/oracle/instantclient/sdk/BASIC_README").include?("32-bit")
    shell("cat /opt/oracle/instantclient/sdk/BASIC_README").include?("11.2.0.2.0")
  }
  meet {
    shell "mkdir ~/tmp"
    shell "cd ~/tmp"
    shell "wget http://csapc1.murdoch.edu.au/babushka-deps/instantclient_11_2-x86.tar"
    shell "tar -xvf instantclient_11_2-x86.tar"
    shell "rm instantclient_11_2x-86.tar"
    sudo  "mkdir -p /opt/oracle/x86/"
    sudo  "rm /opt/oracle/instantclient"
    sudo  "mv instantclient_11_2 /opt/oracle/x86/"
    sudo  "ln -s /opt/oracle/x86/instantclient_11_2 /opt/oracle/instantclient"
  }
end