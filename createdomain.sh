#! /bin/sh
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

# Params
username=$1
domain=$2
if [ "$3" != "no" ]; then
	save="yes";
fi

# Helps
if [ "$username" = "" ] || [ "$domain" = "" ]; then
	echo "$(basename $0) 1:username 2:domain 3:save(yes|no)"
	exit
fi

$(dirname $0)/printzone.sh $domain
$(dirname $0)/registerzone.sh $domain

if [ "$save" = "yes" ]; then
	echo "$domain : Saving domain in domains.db"
	echo "$username $domain" >> "$(dirname $0)/${CONF_PATH}domains.db"
fi

echo "$domain : Reloading Bind9 configuration"
/etc/init.d/bind9 reload
