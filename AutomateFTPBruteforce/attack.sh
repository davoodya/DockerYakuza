#!/bin/bash

# Wait for FTP server to be up
echo "[*] Waiting for FTP service..."
sleep 3

# Run the attack with ncx
echo "[*] Running NetExec FTP test..."
ncx ftp 127.0.0.1 -u testuser -p testpass > /results/ftp-pentest.txt

echo "[*] Scan complete. Result saved to /results/ftp-pentest.txt"
