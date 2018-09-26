#!/usr/bin/env sh

# Remove bundled plugins.
wp plugin uninstall --deactivate --skip-packages \
	akismet \
	hello

# Install 

# This theme is (nearly) empty so nothing displays on the frontend. REST API still works.
wp theme install --activate https://github.com/modelm/no-theme/archive/master.zip

# Remove bundled themes.
wp theme delete --skip-packages \
	twentyfifteen \
	twentysixteen \
	twentyseventeen
