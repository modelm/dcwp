#!/usr/bin/env sh

printf "Waiting for MySQL."
while ! nc -z mysql 3306
do
	printf '.'
	sleep 1
done
echo

if wp core is-installed
then
	echo "WordPress is already installed, exiting."
	exit
fi

wp core install \
	--url="http://localhost:8080" \
	--title="Docker Headless WordPress" \
	--admin_user="wordpress" \
	--admin_password="wordpress" \
	--admin_email="wordpress@example.com" \
	--skip-email

# Update permalink option so REST API routes work.
wp option update permalink_structure "/%year%/%monthnum%/%postname%/" --skip-themes --skip-plugins

# This theme is (nearly) empty so nothing displays on the frontend. REST API still works.
wp theme install --activate https://github.com/modelm/no-theme/archive/master.zip

# Remove bundled packages.
wp plugin uninstall --deactivate --all --skip-packages
wp theme delete --skip-packages \
	twentyfifteen \
	twentysixteen \
	twentyseventeen
