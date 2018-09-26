# Headless WordPress via Docker Compose

[![Build status][https://travis-ci.org/modelm/docker-headless-wordpress.svg]](https://travis-ci.org/modelm/docker-headless-wordpress)

This is a development starter kit for headless WordPress using Docker Compose.

Inspired by [chriszarate/docker-compose-wordpress](https://github.com/chriszarate/docker-compose-wordpress) & [postlight/headless-wp-starter](https://github.com/postlight/headless-wp-starter).

## Setup

       git clone git@github.com:modelm/docker-headless-wordpress.git
       cd docker-headless-wordpress
       docker-compose up -d
       docker-compose run -T --rm wp-cli install-wordpress

## Services

### Apache

The `wordpress` container exposes Apache on host port `8080`:

[http://localhost:8080/wp-json/](http://localhost:8080/wp-json/)

[http://localhost:8080/wp-admin/](http://localhost:8080/wp-admin/)

The default credentials for the WordPress admin user are `wordpress`/`wordpress`.

### MySQL

The `mysql` container exposes MySQL on host port `8306`:

    mysql -uwordpress -pwordpress -h127.0.0.1 -P8306 wordpress

### WP-CLI

The `wp-cli` container supports WP-CLI commands as well as arbitrary shell code e.g.

    docker-compose run -T --rm wp-cli plugin list
    docker-compose run -T --rm wp-cli php -i

You may want to set up a shell alias for easy access:

    alias dwp='docker-compose run -T --rm wp-cli'

## Examples

Install & activate some plugins you might want in a typical headless setup:

    docker-compose run --rm wp-cli plugin install --activate \
        acf-to-wp-api \
        advanced-custom-fields \
        custom-post-type-ui \
        wp-rest-api-v2-menus \
        https://github.com/wp-graphql/wp-graphql/archive/master.zip

View service logs:

    docker-compose logs wordpress
    docker-compose logs mysql

## FAQ

* How to import a SQL dump when the `mysql` container starts?

    https://github.com/docker-library/docs/tree/master/mariadb#initializing-a-fresh-instance

* How to install PHP extensions?

    https://github.com/docker-library/docs/blob/master/php/README.md#how-to-install-more-php-extensions

* Why does the UID of www-data differ between the `wordpress` & `wordpress:cli` images?

    https://github.com/docker-library/wordpress/issues/256
