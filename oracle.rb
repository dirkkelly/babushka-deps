dep "oracle instant client" do
  met? { shell("cat /opt/oracle/instantclient/sdk/ott").include?("jdk1.5") }
  meet {
    shell "mkdir ~/tmp"
    shell "cd ~/tmp"
    shell "wget http://csapc1.murdoch.edu.au/babushka-deps/instantclient_11_2.tar"
    shell "tar -xvf instantclient_11_2.tar"
    shell "rvm instantclient_11_2.tar"
    sudo  "mkdir -p /opt/oracle/"
    sudo  "rm /opt/oracle/instantclient"
    sudo  "mv instantclient_11_2 /opt/oracle/"
    sudo  "ln -s /opt/oracle/instantclient_11_2 /opt/oracle/instantclient"
  }
end