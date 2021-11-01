#!/bin/sh

if [ -z "${UPSTREAM}" ]; then
  echo "env UPSTREAM is required"
  exit 1
fi

sed -i 's/\$UPSTREAM/'${UPSTREAM}'/g' /etc/nginx/nginx.conf

nginx -g "daemon off;"