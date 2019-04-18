#!/bin/bash
# Name:		autocapture.sh
# Author: 	Jared Knutson
# Purpose:	This script will create a directory for the date of the
#		if it does not already exist. It will then initiate a
#		a packet capture using tshark, on two interfaces, mon0
#		and mon1. It will limit capture files to 498M and stop
#		after 24 hours.
# Params:	None.


# Get the current date for creating a capture directory
current=$(date +"%B%d")
dst="../Autocapture/$current/tshark-$current.pcap"
mkdir "../Autocapture/$current"

# Capture on mon0 and mon1, filesize max of 498M and autostop after 24H
tshark -w $dst -i mon0 -i mon1 -b filesize:512000 -a duration:86400
