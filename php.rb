dep "php development" do
  requires "build.managed", "libaio.managed", "phpdev.managed"
end

dep "php oci8" do
  met? { shell("php -m").include?("oci8") }
  meet {
    shell "pecl download oci8"
    shell "tar xzf oci8*"
    shell "cd oci8* && phpize"
    shell "cd oci8* && ./configure --with-oci8=shared,instantclient,$ORACLE_HOME"
    shell "cd oci8* && sudo make all install"
    shell "rm -r oci8*"
    sudo  "echo 'extension=oci8.so' >> /etc/php5/apache2/conf.d/oci8.ini"
  }
end