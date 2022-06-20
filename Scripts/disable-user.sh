#!/bin/bash
#
# Author: 	Daulton
# Website: 	daulton.ca
# Purpose: 	Disables a user account in iRedmail.
# License: 	2-clause BSD license
#
# Example usage: sh disable-user.sh jeff@example.com
# 
# This will print SQL commands on the console directly, you can redirect the
# output to a file for further use like this:
#
# bash disable-user.sh jeff@example.com > output.sql
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
	printf "Purpose: Disables a user account in iRedmail. \n"
	printf "Usage: bash disable-user.sh jeff@example.com \n"
	exit 0
fi

printf "UPDATE mailbox SET active = '0' WHERE username = '${username}';\n"
