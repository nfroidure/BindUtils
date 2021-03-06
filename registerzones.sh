#! /bin/sh
#
# Re-register all zones of the domains saved
#
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

# Params
print=$1
if [ "$print" = "" ]; then
	echo "$(basename $0) 1:(dev|prod)"
	exit
fi

echo "Emptying zone file"
echo "//Here goes production zones;
" > /etc/bind/named.conf.production

echo "Re-registering zones"
while read username domain devonly
do
	if [ "$devonly" == "yes" -a "prod" == "$print" ]; then
		echo "$domain : Skipping "
	else
		$(dirname $0)/registerzone.sh $domain
	fi
done < $(dirname $0)/${CONF_PATH}domains.db
