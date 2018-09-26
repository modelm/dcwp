#!/usr/bin/env sh

# This theme is (nearly) empty so nothing displays on the frontend. REST API still works.
wp theme install --activate https://github.com/modelm/no-theme/archive/master.zip

wp plugin install --activate \
	gutenberg \
	custom-fields-gutenberg \
	pods \
	wp-smushit \
	rest-api-filter-fields \
	wp-rest-filter \
	password-protected \
	fakerpress \
	userswitcher \
	query-monitor \
	debug-bar \
	debug-bar-actions-and-filters-addon \
	debug-bar-constants \
	debug-bar-list-dependencies \
	debug-bar-post-types \
	debug-bar-remote-requests \
	debug-bar-slow-actions \
	debug-bar-taxonomies \
	debug-bar-transients
