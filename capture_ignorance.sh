#!/bin/sh

if [ $# -lt 2 ]
  then
    echo "usage: $0 [interface] [address] [pcap_file=ignorance.pcap]"
  else
    if [ $# -gt 3 ]
      then
        pcapfile=$3
      else
        pcapfile='ignorance.pcap'
    fi

    sudo tcpdump -i $1 -w temp.pcap -c 100000 not host $2 
    tcpdump -r temp.pcap -w $pcapfile not tcp

    # I've witness plenty of Cisco switched networks bleed traffic into my collision domain, without requiring any switch attacks.
    tcpdump -r temp.pcap -w tcpgoodies.pcap tcp
fi
