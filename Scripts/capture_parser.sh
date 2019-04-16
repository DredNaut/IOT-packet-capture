#!/bin/bash
# Name:		capture_parser.sh
# Author: 	Jared Knutson
# Purpose:	This file grabs the names of all IPs from the csv file IOT
#		parse tshark captures. Then creates a file for each of the
#		IPs found in the file. Then removes captures with no traffic
#		associated with them.
# Params:	$1 = .pcap file to read from
# 		$2 = date in the form of (April15)

# Output Directory
output="./Individual_Captures/$2/"


# Read CSV file Allips and search for conversations in the pcap with each, create individual
# file for conversations containing the target IP.
while read name
do

	ip=$(grep -o -e "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" <<< $name)
	writer="$name.pcap"
	echo "[***] CURRENTLY PARSING: $ip"
	tshark -r $1 -w "$output$writer" -2 -R "ip.addr==$ip"

done < Allips


# Rename the files so that their are no spaces in the filename.
find . -name "* *" -type f | rename 's/ /_/g'

# Remove .pcap files which did not have any traffic (272 bytes is the size
# of the empty pcap file.
find . -size 272c -print0 | while IFS= read -r -d $'\0' line
do
	rm $line
done
