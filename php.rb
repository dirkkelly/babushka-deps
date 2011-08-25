dep 'php development' do
  requires 'build.managed', 'libaio.managed', 'phpdev.managed'
end

dep 'oracle instant' do
  met? { shell('cat /opt/oracle/instantclient/sdk/ott').include?('jdk1.5') }
end

dep 'php oci8' do
  requires 'php development', 'oracle instant'
  met? { shell('php -m').include?('oci8') }
end