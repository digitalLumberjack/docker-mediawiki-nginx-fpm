# docker-mediawiki-php5-fpm

Create a mediawiki instance with php5.6-fpm, smtp configuration, mysql database

Use the following ENV when running :
- WIKI_NAME : the name of the wiki
- WIKI_SERVER : the address of the wiki
- WIKI_EMAIL : the email of the wiki notification sender
- WIKI_SECRET : the secret key of the wiki
- WIKI_UPGRADE_KEY : the upgrade key of the wiki
- WIKI_LANG : your lang
- WIKI_ADMIN_LOGIN : the admin login
- WIKI_ADMIN_PASS : the admin pass
- DB_HOST : the hostname of the linked database container
- DB_NAME : the name of the mysql database
- DB_USER : the database user
- DB_PASS : the database password
- SMTP_HOST : the smtp host
- SMTP_USER : the smtp user
- SMTP_PASSWORD : the smtp password
- SMTP_PORT : the smtp port
