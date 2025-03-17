# wordpress-full

Una opción más completa a la imágen oficial de Wordpress.

Este Dockerfile se basa en la imágen oficial de Wordpress pero añadiendo algunas caracteristicas como:

- redis
- memcached
- phpMyAdmin
- Variables: \
     `PHP_MEMORY_LIMIT: 512M` \
     `PHP_UPLOAD_MAX_FILESIZE: 1024M` \
     `PHP_POST_MAX_SIZE: 1024M` \
     `PHP_MAX_EXECUTION_TIME: 180` \
     `PHP_MAX_INPUT_VARS: 4000`

Para construir la imágen: 
```
docker build -t wordpress-chmodmasx:6.7.2-php8.4 .
```
