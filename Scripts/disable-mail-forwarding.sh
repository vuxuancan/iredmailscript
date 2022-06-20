#!/bin/bash
#
# Author: 	Daulton
# Website: 	daulton.ca
# Purpose: 	Disable mail forwarding or from an alias, from a user account to another mail account in iRedmail.
# License: 	2-clause BSD license
#
# bash disable-mail-forwarding.sh fromUser@example.com toUser@example.com
# 
# This will print SQL commands on the console directly, you can redirect the
# output to a file for further use like this:
# 
# bash disable-mail-forwarding.sh fromUser@example.com toUser@example.com > output.sql
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
fromUser="$1"
toUser="$2"

if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "/h" ] || [ $# -ne 2 ]; then
	printf "Purpose: Disable mail forwarding or from an alias, from a user account to another mail account in iRedmail. \n"
	printf "Usage: bash disable-mail-forwarding.sh fromUser@example.com toUser@example.com \n"
	exit 0
fi

printf "UPDATE forwardings SET active = '0' where address = '$fromUser' AND forwarding = '$toUser';\n"
