$ttl 86400
{domain.name}.	IN		SOA		{domain.ns}. webmaster.{domain.name}. (
				2009101501
				21600
				3600
				604800
				86400 )
				IN		NS		{domain.ns}.
				IN		NS		{domain.sdns}.
				IN		MX		10 mail.{domain.name}.
				IN		A		{domain.ip}
www				IN		A		{domain.ip}
mail				IN		A		{domain.ip}
smtp				IN		A		{domain.ip}
pop				IN		A		{domain.ip}
pop3				IN		A		{domain.ip}
imap				IN		A		{domain.ip}
sql				IN		A		{domain.ip}
mysql				IN		A		{domain.ip}
*				IN		A		{domain.ip}
				IN		TXT		"v=spf1 a mx ip4:{domain.ip} include:orange.fr include:wanadoo.fr include:free.fr ~all"
