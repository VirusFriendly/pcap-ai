#!/bin/sh

if [ $# -lt 1 ]
  then
    echo "usage: $0 [killfile] [pcap_file=ignorance.pcap]"
  else
    if [ $# -gt 1 ]
      then
        pcapfile=$2
      else
        pcapfile=ignorance.pcap
    fi

    tcpdump -tnr $pcapfile |egrep -vf $1 |sort -u|less
fi
