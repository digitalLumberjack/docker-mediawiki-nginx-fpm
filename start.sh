#!/bin/bash

if [[ ! -f "/var/www/mediawiki" || "${FORCE_REINSTALL}" == "1" ]]; then
  mkdir /usr/share/install/
  cd /usr/share/install/
  curl -o mediawiki-1.26.2.tar.gz https://releases.wikimedia.org/mediawiki/1.26/mediawiki-1.26.2.tar.gz
  mkdir -p /var/www/mediawiki
  tar -xvf mediawiki-1.26.2.tar.gz -C /var/www/mediawiki --strip 1
  cp /usr/local/share/LocalSettings.php /var/www/mediawiki

  php install.php [--conf|--confpath|--dbname|--dbpass|--dbpassfile|--dbpath|--dbport|--dbprefix|--dbschema|--dbserver|--dbtype|--dbuser|--env-checks|--globals|--help|--installdbpass|--installdbuser|--lang|--memory-limit|--pass|--passfile|--profiler|--quiet|--scriptpath|--server|--wiki] [name] <admin>

fi

php-fpm
