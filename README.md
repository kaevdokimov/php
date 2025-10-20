# PHP 8.4 Docker Image

[![PHP](https://img.shields.io/badge/PHP-8.4-green.svg)](https://php.net/)
[![Alpine](https://img.shields.io/badge/Alpine-3.22-green.svg)](https://php.net/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://docker.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Docker-образ на основе Alpine Linux 3.22 и PHP 8.4 с предустановленными расширениями и настройками для работы с Symfony.

## Содержимое образа

- [Alpine Linux 3.22](https://alpinelinux.org/posts/Alpine-3.22.0-released.html)
- [PHP 8.4](https://www.php.net/releases/8.4/index.php)
- Установленные расширения PHP, необходимые для [Symfony](https://symfony.com/)
- Настроенный [PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
- [PostgreSQL](https://www.postgresql.org/)
- [RabbitMQ](https://www.rabbitmq.com/)
- [Redis](https://redis.io/)
- [OPcache](https://www.php.net/manual/en/book.opcache.php)
- [Xdebug](https://xdebug.org/)
- [APCu](https://www.php.net/manual/en/book.apcu.php)
- [SimpleXML](https://www.php.net/manual/en/book.simplexml.php)
- [Composer 2](https://getcomposer.org/)
- [Curl](https://curl.se/)
- [Bash](https://www.gnu.org/software/bash/)
- [Make](https://www.gnu.org/software/make/)
- [Pcre](https://www.pcre.org/)
- [PCNTL](https://www.php.net/manual/en/book.pcntl.php)

## Использование

```dockerfile
FROM ghcr.io/kaevdokimov/php:php84-dev
FROM ghcr.io/kaevdokimov/php:php84
```

## Мультиархитектурная сборка

Образ доступен для следующих архитектур:
- linux/amd64
- linux/arm64

## Лицензия

MIT

## Поддержка

По вопросам использования образа обращайтесь в Issues.
