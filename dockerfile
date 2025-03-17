FROM wordpress:6.7.2-php8.4

# Instalación de la extensión Redis para PHP
RUN pecl install redis \
    && docker-php-ext-enable redis \
    && apt update && apt install -y libmemcached-dev zlib1g-dev libssl-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && pecl install igbinary



# Configuración de parámetros de PHP
RUN touch /usr/local/etc/php/conf.d/php.ini
RUN echo "memory_limit = \${PHP_MEMORY_LIMIT}" > /usr/local/etc/php/conf.d/php.ini \
    && echo "upload_max_filesize = \${PHP_UPLOAD_MAX_FILESIZE}" >> /usr/local/etc/php/conf.d/php.ini \
    && echo "post_max_size = \${PHP_POST_MAX_SIZE}" >> /usr/local/etc/php/conf.d/php.ini \
    && echo "max_execution_time = \${PHP_MAX_EXECUTION_TIME}" >> /usr/local/etc/php/conf.d/php.ini \
    && echo "max_input_vars = \${PHP_MAX_INPUT_VARS}" >> /usr/local/etc/php/conf.d/php.ini \
    && echo "extension=redis.so" >> /usr/local/etc/php/conf.d/php.ini \
    && echo "extension=memcached.so" >> /usr/local/etc/php/conf.d/php.ini \
    && echo "extension=igbinary.so" >> /usr/local/etc/php/conf.d/php.ini

ENV WORDPRESS_CONFIG_EXTRA="\
    define('WP_REDIS_HOST', 'redis');\
    define('WP_REDIS_PORT', '6379');\
    define('WP_MEMORY_LIMIT', getenv('WP_MEMORY_LIMIT') ?: '512M');\
    define('WP_CACHE', true);\
    \$memcached_servers = array(\
        array('memcached', 11211)\
    );"
