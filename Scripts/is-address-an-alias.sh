#!/bin/bash
#
# Author: 	Daulton
# Website: 	daulton.ca
# Purpose: 	Determine if a given email address is an alias in iRedmail.
# License: 	2-clause BSD license
# Reference: https://docs.iredmail.org/sql.create.mail.alias
#
# bash is-address-an-alias.sh jeff@example.com
# 
# This will print SQL commands on the console directly, you can redirect the
# output to a file for further use like this:
#
# bash is-address-an-alias.sh jeff@example.com > output.sql
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
address="$1"

if [ "$1" == "-h" ] || [ "$1" == "--h" ] || [ "$1" == "/h" ] || [ $# -ne 1 ]; then
	printf "Purpose: Determine if a given email address is an alias in iRedmail. \n"
	printf "Usage: bash is-address-an-alias.sh jeff@example.com \n"
	exit 0
fi

printf "SELECT id,address,forwarding,domain FROM forwardings WHERE is_list = '1' AND address = '${address}'; \n"
