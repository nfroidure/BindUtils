#! /bin/sh
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

# Config
SERVER_DOMAIN=$(cat "$(dirname $0)/${CONF_PATH}domain");

# Params
domain=$1

# Helps
if [ "$domain" = "" ]; then
	echo "$(basename $0) 1:domain"
	exit
fi

echo "$domain : Adding the domain zone to /etc/bind/named.conf.production"
echo "
zone \"$domain.$SERVER_DOMAIN\" {
	type $type;
	file \"/etc/bind/pri/$domain.zone\";
};" >> /etc/bind/named.conf.production
