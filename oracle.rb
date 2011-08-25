dep "oracle instant client" do
  requires "oracle environment settings"
  met? {
    Dir.exists?  "/opt/oracle/instantclient"
    if File.exists? "/opt/oracle/instantclient/BASIC_README"
      shell("cat /opt/oracle/instantclient/BASIC_README").include?("32-bit")
      shell("cat /opt/oracle/instantclient/BASIC_README").include?("11.2.0.2.0")
    end
  }
  meet {
    shell "mkdir -p ~/tmp"
    shell "cd ~/tmp"
    shell "curl http://csapc1.murdoch.edu.au/babushka-deps/instantclient_11_2-x86.tar > ~/tmp/instantclient_11_2-x86.tar"
    shell "tar -xf ~/tmp/instantclient_11_2-x86.tar"
    shell "rm ~/tmp/instantclient_11_2-x86.tar"
    sudo  "mkdir -p /opt/oracle/x86/"
    sudo  "rm /opt/oracle/instantclient"
    sudo  "rm -rf /opt/oracle/x86/instantclient_11_2"
    sudo  "mv instantclient_11_2 /opt/oracle/x86/"
    sudo  "ln -s /opt/oracle/x86/instantclient_11_2 /opt/oracle/instantclient"
  }
end

dep "oracle environment settings" do
  met? {
    shell("cat ~/.bashrc").include?("ORACLE_BASE='/opt/oracle/instantclient'")
    shell("cat ~/.bashrc").include?("ORACLE_HOME='/opt/oracle/instantclient'")
    shell("cat ~/.bashrc").include?("LD_LIBRARY_PATH='/opt/oracle/instantclient'")
    shell("cat ~/.bashrc").include?("TNS_ADMIN='/opt/oracle/instantclient'")
  }
  meet {
    shell "echo \"export ORACLE_BASE='/opt/oracle/instantclient'\" >> ~/.bashrc"
    shell "echo \"export ORACLE_HOME='$ORACLE_BASE'\" >> ~/.bashrc"
    shell "echo \"export LD_LIBRARY_PATH='$ORACLE_BASE'\" >> ~/.bashrc"
    shell "echo \"export TNS_ADMIN='$ORACLE_BASE'\" >> ~/.bashrc"
  }
end