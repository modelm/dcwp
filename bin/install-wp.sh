#!/usr/bin/env sh

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
