#! /bin/sh
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

# Params
keepold=$1

# Help
if [ "$keepold" = "" ]; then
echo "Import last saved configuration"
echo "init.sh 1:keepold (yes/no)"
fi

if [ "$keepold" = "yes" ]; then
	echo "Saving old bind9 replaced configuration files"
	mv /etc/bind/named.conf /home/elitwork/utils/bind9/conf/named.conf.old
	mv /etc/bind/named.conf.default-zones /home/elitwork/utils/bind9/conf/named.conf.default-zones.old
	mv /etc/bind/named.conf.local /home/elitwork/utils/bind9/conf/named.conf.local.old
	mv /etc/bind/named.conf.options /home/elitwork/utils/bind9/conf/named.conf.options.old
	mv /etc/bind/zones.rfc1918 /home/elitwork/utils/bind9/conf/zones.rfc1918.old
	echo "Saving old other configuration files"
	mv /etc/bind/db.0 /home/elitwork/utils/bind9/conf/db.0.old
	mv /etc/bind/db.127 /home/elitwork/utils/bind9/conf/db.127.old
	mv /etc/bind/db.255 /home/elitwork/utils/bind9/conf/db.255.old
	mv /etc/bind/db.empty /home/elitwork/utils/bind9/conf/db.empty.old
	mv /etc/bind/db.root /home/elitwork/utils/bind9/conf/db.root.old
	echo "Saving old custom configuration files"
	mv /home/elitwork/utils/bind9/db.ewk /etc/bind/conf/db.ewk.old
	mv /home/elitwork/utils/bind9/db.192.168.1 /etc/bind/conf/db.192.168.1.old
fi

echo "Importing saved configuration files"
cp /home/elitwork/utils/bind9/conf/named.conf.bck /etc/bind/named.conf
cp /home/elitwork/utils/bind9/conf/named.conf.default-zones.bck /etc/bind/named.conf.default-zones
cp /home/elitwork/utils/bind9/conf/named.conf.local.bck /etc/bind/named.conf.local
cp /home/elitwork/utils/bind9/conf/named.conf.options.bck /etc/bind/named.conf.options
cp /home/elitwork/utils/bind9/conf/zones.rfc1918.bck /etc/bind/zones.rfc1918
cp /home/elitwork/utils/bind9/conf/db.0.bck /etc/bind/db.0
cp /home/elitwork/utils/bind9/conf/db.127.bck /etc/bind/db.127
cp /home/elitwork/utils/bind9/conf/db.255.bck /etc/bind/db.255
cp /home/elitwork/utils/bind9/conf/db.empty.bck /etc/bind/db.empty
cp /home/elitwork/utils/bind9/conf/db.root.bck /etc/bind/db.root

echo "Adding saved custom zones"
cp /home/elitwork/utils/bind9/conf/db.ewk.bck /etc/bind/db.ewk
cp /home/elitwork/utils/bind9/conf/db.192.168.1.bck /etc/bind/db.192.168.1

echo "Adding primary and secondary zones"
cp /home/elitwork/utils/bind9/pri/* /etc/bind/pri/
cp /home/elitwork/utils/bind9/sec/* /etc/bind/sec/