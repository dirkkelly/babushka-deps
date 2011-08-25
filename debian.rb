dep "squeeze non free" do
  met? { shell("cat /etc/apt/sources.list").include?("non-free") }
  meet {
    sudo "echo 'deb http://mirror.aarnet.edu.au/debian/ squeeze non-free' >> /etc/apt/sources.list"
    sudo "echo 'deb-src http://mirror.aarnet.edu.au/debian/ squeeze-updates non-free' >> /etc/apt/sources.list"
    sudo "apt-get update"
  }
end