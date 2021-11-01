#!/bin/sh

if [ -z "${ID}" ]; then
  echo "env ID is required"
  exit 1
fi

sed -i 's/\$ID/'${ID}'/g' /etc/v2ray/config.json

v2ray -config=/etc/v2ray/config.json