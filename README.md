This shell scripts are designed to allow some basic Bind9 administration operations to be done easily on a Debian system. It is distributed under GNU/GPL v2 licence so use it at you own risks.

# Config
Set the config path in the *.sh files. And do in the config folder :
echo "serverip" > ip;
echo "pridns.server.com" > dns;
echo "secns.server.com" > sdns;
echo "serverdomain" > domain; # This is for local server only

# Scripts
createdomain.sh : Add a domain to the server domain
printzone.sh : Print a zone for the given domain
printzones.sh : Reprint zones of all the saved domains
registerzone.sh : Register a zone file for the given domain
resiterzones.sh : Re-register zone files for all the saved domains

# Modify
If you improve those scripts, please, pull your commits !