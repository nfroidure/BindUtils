#! /bin/sh
#
# Re-register all zones of the domains saved
#
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

echo "Re-registering zones"
while read username domain
do
	$(dirname $0)/registerzone.sh $domain
done < "$(dirname $0)/${CONF_PATH}domains.db"
