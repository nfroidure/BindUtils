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
SERVER_IP6=$(cat "$(dirname $0)/${CONF_PATH}ip6");
SERVER_NS=$(cat "$(dirname $0)/${CONF_PATH}dns");
SERVER_SDNS=$(cat "$(dirname $0)/${CONF_PATH}sdns");
SERVER_MAIL=$(cat "$(dirname $0)/${CONF_PATH}mailserver");

# Params
domain=$1
username=$2

# Help
if [ "$domain" = "" ]; then
	echo "$(basename $0) 1:domain 2:username"
	exit
fi

echo "$domain : Printing the domain zone"
cp $(dirname $0)/tpl/zone.tpl "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.name}/$domain$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.ip}/$SERVER_IP/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.ip6}/$SERVER_IP6/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.ns}/$SERVER_NS$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.sdns}/$SERVER_SDNS$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"
sed -i "s/{domain.mail}/$SERVER_MAIL$SERVER_DOMAIN/g" "/etc/bind/pri/$domain.zone"

if [ -f "/home/$username/$domain.zone" ]; then
	echo "$domain : Adding zone special configuration"
	cat /home/$username/$domain.zone >> "/etc/bind/pri/$domain.zone"
fi

if [ -f "/home/$username/$domain.full.zone" ]; then
	echo "$domain : Adding fullzone special configuration"
	cat /home/$username/$domain.zone > "/etc/bind/pri/$domain.zone"
fi
