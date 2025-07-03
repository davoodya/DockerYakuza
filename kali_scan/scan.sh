#!/bin/bash

if [ -z "$1" ]; then
  echo "Please Enter target IP or Domain"
  echo "./scan.sh 192.168.1.1"
  exit 1
fi

echo "Start Scanning: $1"
nmap -sV -T4 --unprivileged "$1"
