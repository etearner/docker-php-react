# Docker Php React

## Set a docker envrionment for a web app that use PHP and React

This project is a standalone sketelon that bring a default docker-compose configuration to help you to start from scratch a project that uses PHP and React, with Postgres as database manager.

The versions used are :

- Php: 8.2
- Node: 18
- Postgres: 16

In supplement you also have a datatabase management tool through [PgAdmin4](https://www.pgadmin.org/).

## Available Scripts

This project contains a Makefile, that group commands shortcuts to run for using it. Make sure **GNU/Makefile** is present on your system.

## SSL and hostnames

According to Nginx, these domains are set by default for each service. All domains use the **https** protocol.

### Hostname

- API : https://api.etearner.com
- Db Tool Manager : https://db.etearner.com

Make sur to change it as you wish, and do not forget to record them in your local hosts.

### SSL

To make your hostnames work, you should generate SSL certificate by yourself, using Openssl or web tools that offers this possibility.
Your certificates should be stored at `services/nginx/ssl`.

# Tags

`php` `docker` `docker-compose` `react` `node` `nodejs` `js` `postgres` `pgAdmin`
