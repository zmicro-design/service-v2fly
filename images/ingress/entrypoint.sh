#!/bin/sh

CONFIG=/etc/nginx/nginx.conf
CONFIG_TPL=/etc/nginx/nginx.conf.tmp

if [ -z "${UPSTREAM_VMESS}" ]; then
  echo "env UPSTREAM_VMESS is required"
  exit 1
fi

if [ -z "${UPSTREAM_VLESS}" ]; then
  echo "env UPSTREAM_VLESS is required"
  exit 1
fi

if [ -z "${UPSTREAM_SHADOWSOCKS}" ]; then
  echo "env UPSTREAM_SHADOWSOCKS is required"
  exit 1
fi

if [ -z "${UPSTREAM_TROJAN}" ]; then
  echo "env UPSTREAM_TROJAN is required"
  exit 1
fi

if [ ! -f "$CONFIG_TPL" ]; then
  cp $CONFIG $CONFIG_TPL
fi

cat $CONFIG_TPL \
  | sed "s/<UPSTREAM_VMESS>/${UPSTREAM_VMESS}/" \
  | sed "s/<UPSTREAM_VLESS>/${UPSTREAM_VLESS}/" \
  | sed "s/<UPSTREAM_SHADOWSOCKS>/${UPSTREAM_SHADOWSOCKS}/" \
  | sed "s/<UPSTREAM_TROJAN>/${UPSTREAM_TROJAN}/" \
  > $CONFIG

echo "ingress for v2ray starting ..."

nginx -g "daemon off;"