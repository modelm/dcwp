# Headless WordPress via Docker Compose

[![Build status][build-status]][travis-ci]

This project is a boilerplate starter for headless WordPress including:

* [Official Docker WordPress image][docker-wordpress]
* [No Theme](https://github.com/modelm/no-theme) to effectively disable the WordPress frontend
* [ACF to WP-API](https://wordpress.org/plugins/acf-to-wp-api/)
* [Advanced Custom Fields](https://wordpress.org/plugins/advanced-custom-fields/)
* [Custom Post Type UI](https://wordpress.org/plugins/custom-post-type-ui/)
* [EWWW Image Optimizer](https://wordpress.org/plugins/ewww-image-optimizer/)
* [WP Migrate DB](https://wordpress.org/plugins/wp-migrate-db/)
* [WP-REST-API V2 Menus](https://wordpress.org/plugins/wp-rest-api-v2-menus/)
* [WPGraphQL](https://wpgraphql.com/)

## Setup

1. Clone this repo.

       git clone git@github.com:modelm/docker-headless-wordpress.git

2. Initialize containers.

       docker-compose up -d

3. Install WordPress, plugins, and theme. Optionally edit `bin/install-wp.sh` first to suit your needs.

       docker-compose run --rm wp-cli install-wp

## WordPress

The `wordpress` container exposes Apache on host port 8080:

[http://localhost:8080/wp-json/](http://localhost:8080/wp-json/)

[http://localhost:8080/wp-admin/](http://localhost:8080/wp-admin/) `wordpress`/`wordpress`

## MySQL

The `mysql` container exposes MySQL on host port 8306:

    mysql -uwordpress -pwordpress -h127.0.0.1 -P8306 wordpress

## WP-CLI

The `wp-cli` container supports WP-CLI commands as well as arbitrary shell code e.g.

    docker-compose run --rm wp-cli plugin list
    docker-compose run --rm wp-cli php -i

[build-status]: https://travis-ci.org/modelm/docker-headless-wordpress.svg?branch=master
[travis-ci]: https://travis-ci.org/modelm/docker-headless-wordpress
[docker-wordpress]: https://hub.docker.com/_/wordpress/
