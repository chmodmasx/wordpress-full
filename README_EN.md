# wordpress-full

A more complete alternative to the official Wordpress image.

This Dockerfile is based on the official Wordpress image but adds some features such as:

- redis
- memcached
- phpMyAdmin
- Variables: \
`PHP_MEMORY_LIMIT: 512M` \
`PHP_UPLOAD_MAX_FILESIZE: 1024M` \
`PHP_POST_MAX_SIZE: 1024M` \
`PHP_MAX_EXECUTION_TIME: 180` \
`PHP_MAX_INPUT_VARS: 4000`

To build the image:
```
docker build -t wordpress-chmodmasx:6.7.2-php8.4 .
```
