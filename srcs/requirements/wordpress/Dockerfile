# syntax=docker/dockerfile:1
# check=error=true

FROM debian:oldstable

RUN apt update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    && rm -rf /var/lib/apt/lists/*


RUN sed -i 's|listen = .*|listen = 9000|g' $(find /etc/php/ -name www.conf)

RUN mkdir -p /run/php

COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/wordpress

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

CMD ["php-fpm", "-F"]