#!/usr/bin/env sh

wp core install \
	--url="http://localhost:8080" \
	--title="Docker Headless WordPress" \
	--admin_user="admin" \
	--admin_email="admin@example.com" \
	--skip-email

# Without this, /wp-json/ routes don't work.
wp option update permalink_structure "/%year%/%monthnum%/%postname%/" --skip-themes --skip-plugins

wp plugin uninstall --all
wp plugin install --activate \
	acf-to-wp-api \
	advanced-custom-fields \
	custom-post-type-ui \
	ewww-image-optimizer \
	wp-migrate-db \
	wp-rest-api-v2-menus

wp theme install --activate https://github.com/modelm/no-theme/archive/master.zip
wp theme delete twentyfifteen twentysixteen twentyseventeen
