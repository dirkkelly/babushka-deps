dep "php development" do
  requires "build.managed", "libaio.managed", "phpdev.managed"
end

dep "php oci8" do
  met? { shell("php -m").include?("oci8") }
end