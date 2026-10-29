# syntax=docker/dockerfile:1
# check=error=true

FROM debian:bookworm

RUN apt update && apt-get install -y \
    php-fpm \
    php-mysql \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN sed -i 's|listen = .*|listen = 9000|g' $(find /etc/php/ -name www.conf)

RUN mkdir -p /run/php

COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

CMD ["php-fpm8.2", "-F"]