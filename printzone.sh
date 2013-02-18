#! /bin/sh
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

# Config
SERVER_DOMAIN=$(cat "$(dirname $0)/${CONF_PATH}domain");
if [ "$SERVER_DOMAIN" != "" ]; then
SERVER_DOMAIN=".$SERVER_DOMAIN"
fi
SERVER_IP=$(cat "$(dirname $0)/${CONF_PATH}ip");
SERVER_NS=$(cat "$(dirname $0)/${CONF_PATH}dns");
SERVER_SDNS=$(cat "$(dirname $0)/${CONF_PATH}sdns");

# Params
domain=$1

# Help
if [ "$domain" = "" ]; then
	echo "$(basename $0) 1:domain"
	exit
fi

echo "$domain : Printing the domain zone"
cp $(dirname $0)/tpl/zone.tpl "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.name}/$domain$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.ip}/$SERVER_IP/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.ns}/$SERVER_NS$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.sdns}/$SERVER_SDNS$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"
