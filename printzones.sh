#! /bin/bash
#
# Reprint all zones of the domains saved
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

echo "Re-printing zones"
while read username domain devonly
do
	if [ "$devonly" == "yes" -a "prod" == "$print" ]; then
		echo "$domain : Skipping "
	else
		$(dirname $0)/printzone.sh $domain $username
	fi
done < $(dirname $0)/${CONF_PATH}domains.db
