FROM nginx:1.21.3-alpine

COPY web /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /

CMD  sh /entrypoint.sh