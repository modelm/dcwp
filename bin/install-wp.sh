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

wp plugin install --activate \
	acf-to-wp-api \
	advanced-custom-fields \
	custom-post-type-ui \
	ewww-image-optimizer \
	wp-migrate-db \
	wp-rest-api-v2-menus \
	https://github.com/wp-graphql/wp-graphql/archive/v0.0.33.zip
