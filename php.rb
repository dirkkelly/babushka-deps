dep 'php development' do
  requires 'build.managed', 'libaio.managed', 'phpdev.managed'
end

dep 'php oci8' do
  requires 'php development'
  met? { shell('php -m').include?('oci8') }
end