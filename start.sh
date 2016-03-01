#!/bin/bash

if [[ ! -f "/var/www/mediawiki" || "${FORCE_REINSTALL}" == "1" ]]; then
  mkdir /usr/share/install/
  cd /usr/share/install/
  curl -o mediawiki-1.26.2.tar.gz https://releases.wikimedia.org/mediawiki/1.26/mediawiki-1.26.2.tar.gz
  mkdir -p /var/www/mediawiki
  tar -xvf mediawiki-1.26.2.tar.gz -C /var/www/mediawiki --strip 1
  cd /var/www/mediawiki
  php maintenance/install.php --scriptpath "" --dbname ${DB_NAME} --dbpass ${DB_PASS} --dbserver ${DB_HOST} \
  --dbtype mysql --dbuser ${DB_USER} --installdbpass ${DB_PASS} --installdbuser ${DB_USER}\
  --lang ${WIKI_LANG} --pass ${WIKI_ADMIN_PASS} --server ${WIKI_SERVER} ${WIKI_NAME} ${WIKI_ADMIN_LOGIN} 
  cat << EOF >> LocalSettings.php
\$wgSMTP = array(
 'host'     => "ssl://${SMTP_HOST}", // could also be an IP address. Where the SMTP server is located
 'IDHost'   => "${SMTP_HOST}",      // Generally this will be the domain name of your website (aka mywiki.org)
 'port'     => ${SMTP_PORT},                 // Port to use when connecting to the SMTP server
 'auth'     => true,               // Should we use SMTP authentication (true or false)
 'username' => "${SMTP_USER}",     // Username to use for SMTP authentication (if being used)
 'password' => "${SMTP_PASSWORD}"       // Password to use for SMTP authentication (if being used)
);
EOF
fi
sed -i "s|\$wgEmergencyContact.*|\$wgEmergencyContact = \"${WIKI_EMAIL}\";|" LocalSettings.php
sed -i "s|\$wgPasswordSender.*|\$wgPasswordSender = \"${WIKI_EMAIL}\";|" LocalSettings.php

php-fpm
