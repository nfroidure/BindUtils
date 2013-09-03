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
				IN		AAAA {domain.ip6}
www				IN		A		{domain.ip}
www				IN		AAAA {domain.ip6}
mail				IN		A		{domain.mail}
smtp				IN		A		{domain.mail}
pop				IN		A		{domain.mail}
pop3				IN		A		{domain.mail}
imap				IN		A		{domain.mail}
sql				IN		A		{domain.ip}
mysql				IN		A		{domain.ip}
*				IN		A		{domain.ip}
				IN		TXT		"v=spf1 a mx ip4:{domain.mail} include:orange.fr include:wanadoo.fr include:free.fr ~all"

