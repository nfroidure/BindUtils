#! /bin/sh
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

# Params
fordev=$1

# Help
if [ "$fordev" = "" ]; then
echo "Initialize bind configuration";
echo "$(basename $0) 1:fordev(yes|no)";
exit;
fi

echo "Adding production zones"
echo "//Here goes production zones;
" >> /etc/bind/named.conf.production
echo "
include \"/etc/bind/named.conf.production\";" >> /etc/bind/named.conf


if [ "$fordev" = "yes" ]; then
	echo "Setting local zones"

	echo "1.168.192.in-addr.arpa. IN SOA ns.ewk. admin.ns.ewk. (
	23
	10800
	3600
	604800
	86400 )
1.168.192.in-addr.arpa. IN NS ns.ewk.
202.1.168.192.in-addr.arpa. IN PTR ns.ewk." > /etc/bind/db.192.168.1.test

	echo "ewk. IN SOA ns.ewk. admin.ewk. (
	23
	10800
	3600
	604800
	86400 )
ewk. IN NS ns.ewk.
;ewk. IN NS sdns.ewk.
ewk. IN A 192.168.1.202
server.ewk. IN A 192.168.1.202
ns.ewk. IN A 192.168.1.202
;sdns.ewk. IN A 192.168.1.202
router.ewk. IN A 192.168.1.5
nas.ewk. IN A 192.168.1.206" > /etc/bind/db.ewk

	echo "//
// Do any local configuration here
//

zone \"1.168.192.in-addr.arpa\" {
	type master;
	file \"/etc/bind/db.192.168.1\";
};

zone \"ewk\" {
	type master;
	file \"/etc/bind/db.ewk\";
};

// Consider adding the 1918 zones here, if they are not used in your
// organization
include \"/etc/bind/zones.rfc1918\";" > /etc/bind/named.conf.local

fi


echo "Creating zones directories"
mkdir /etc/bind/pri/
mkdir /etc/bind/sec/
