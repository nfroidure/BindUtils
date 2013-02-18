#! /bin/sh
# Copyright 2012 Elitwork
# Distributed under the terms of the GNU General Public License v2

# Constants
CONF_PATH="../conf/";

echo "Saving configuration files"
cp /etc/bind/named.conf /home/elitwork/utils/bind9/conf/named.conf.bck
cp /etc/bind/named.conf.default-zones /home/elitwork/utils/bind9/conf/named.conf.default-zones.bck
cp /etc/bind/named.conf.local /home/elitwork/utils/bind9/conf/named.conf.local.bck
cp /etc/bind/named.conf.options /home/elitwork/utils/bind9/conf/named.conf.options.bck
cp /etc/bind/zones.rfc1918 /home/elitwork/utils/bind9/conf/zones.rfc1918.bck
cp /etc/bind/db.0 /home/elitwork/utils/bind9/conf/db.0.bck
cp /etc/bind/db.127 /home/elitwork/utils/bind9/conf/db.127.bck
cp /etc/bind/db.255 /home/elitwork/utils/bind9/conf/db.255.bck
cp /etc/bind/db.empty /home/elitwork/utils/bind9/conf/db.empty.bck
cp /etc/bind/db.root /home/elitwork/utils/bind9/conf/db.root.bck

echo "Saving custom zones"
cp /etc/bind/db.ewk /home/elitwork/utils/bind9/conf/db.ewk.bck
cp /etc/bind/db.192.168.1 /home/elitwork/utils/bind9/conf/db.192.168.1.bck

echo "Saving primary and secondary zones"
cp /etc/bind/pri/* /home/elitwork/utils/bind9/pri/
cp /etc/bind/sec/* /home/elitwork/utils/bind9/sec/