# syntax=docker/dockerfile:1
# check=error=true

FROM debian:oldstable

ENV path_ssl=/etc/nginx/ssl

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${path_ssl}

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2050 \
    -keyout ${path_ssl}/inception.key \
    -out ${path_ssl}/inception.crt \
    -subj "/C=FR/ST=Normandie/L=Le Havre/O=42LeHavre/CN=ael-ghaz.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# COPY /html/index.html /var/www/wordpress/index.html

CMD ["nginx", "-g", "daemon off;"]