# PHP 8.4 Docker Image

Docker-образ на основе PHP 8.4 с предустановленными расширениями и настройками для работы с Symfony.

## Содержимое образа

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
- [Wget](https://wikipedia.org/wiki/Wget)
- [Curl](https://curl.se/)
- [Cron](https://crontab.guru/)
- [OpenSSH Client](https://www.openssh.com/)
- [Bash](https://www.gnu.org/software/bash/)
- [Make](https://www.gnu.org/software/make/)
- [GCC](https://gcc.gnu.org/)
- [G++](https://gcc.gnu.org/)
- [Autoconf](https://www.gnu.org/software/autoconf/)
- [Pcre](https://www.pcre.org/)
- [PCNTL](https://www.php.net/manual/en/book.pcntl.php)
- Zip, Unzip, Libzip-dev, Zlib-dev
- Git

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
