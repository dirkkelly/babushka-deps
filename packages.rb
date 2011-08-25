dep 'sed.managed' do
  installs { via :macports, 'gsed' }
  provides 'sed'
  after {
    cd '/opt/local/bin' do
      sudo "ln -s gsed sed"
    end
  }
end
dep 'sshd.managed' do
  installs { via :apt, 'openssh-server' }
end
dep 'build.managed' do
  installs { via :apt, 'build-essential' }
  provides []
end
dep 'libssl.managed' do
  installs { via :apt, 'libssl-dev' }
  provides []
end
dep 'libaio.managed' do
  installs { via :apt 'libaio-dev', 'libaio1' }
  provides []
end
dep 'phpdev.managed' do
  installs { via :apt 'php5-dev' }
  provides []
end