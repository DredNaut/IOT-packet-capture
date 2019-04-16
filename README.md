# IOT Device Captures using TSHARK
#### Author: Jared Knutson

## Description
For this project I was tasked with setting up various types of IOT devices in order to assist with creating a ML model which could identify a device model and manufacturer, by observing certain packet header which are sent in a network.


For this project I designed the system for generating capture files, as well as organizing a structure for parsing these files in order to seperate traffic between devices indicated by their IP address.

## Scripts

The scripts as part of this project are used in the process of initiating the capture process and parsing the capture files for each device in the roster.

### autocapture.sh

This bash script uses tshark to begin a non-discriminatory capture on the local network using two different network cards. The script will save files in the "Autocapture" directory by the date that the capture took place and will limit the pcap files to 498MB.


### capture_parser.sh

This bash script parses and stores pcap files seperated by device into directories in cordination with the date that the capture took place. This script also does the work of removing pcap files which no traffic exists.
