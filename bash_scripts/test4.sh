#!bin/bash
#loop through command output
for user in $(cut -d: -f1 /etc/passwd)
do
	echo "$user"
done
