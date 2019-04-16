current=$(date +"%B%d")
mkdir "/root/Autocapture/$current"
dst="/root/Autocapture/$current/tshark-$current.pcap"
tshark -w $dst -i mon0 -i mon1 -b filesize:512000 -a duration:172800

