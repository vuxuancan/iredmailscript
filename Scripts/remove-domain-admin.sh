#!/bin/bash
#
# Author: 	Daulton
# Website: 	daulton.ca
# Purpose: 	Remove a users entry entirely from the domain_admins table in iRedMail.
# License: 	2-clause BSD license
#
# bash remove-domain-admin.sh user@example.com
#
# This will print SQL commands on the console directly, you can redirect the
# output to a file for further use like this:
# 
# bash remove-domain-admin.sh user@example.com > output.sql
#
# Import output.sql into SQL database like below:
#
# mysql -uroot -p
# mysql> USE vmail;
# mysql> SOURCE /path/to/output.sql;
#
# psql -U vmailadmin -d vmail
# sql> \i /path/to/output.sql;

# Read input
username="$1"

if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "/h" ] || [ $# -ne 1 ]; then
	printf "Purpose: Remove a users entry entirely from the domain_admins table in iRedMail. \n"
	printf "Usage: bash remove-domain-admin.sh user@example.com \n"
	exit 0
fi

printf "DELETE from domain_admins WHERE username = '${username}'; \n"
printf "UPDATE mailbox SET isadmin = '0' WHERE username = '${username}';\n"
printf "UPDATE mailbox SET isglobaladmin = '0' WHERE username = '${username}';\n"
