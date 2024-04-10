#!/bin/bash
PUBLIC_IP=$(curl -s https://ipinfo.io/ip)
PRIVATE_IP=$(hostname -I | awk '{print $1}')

echo "Public IP: ${PUBLIC_IP}"
echo "Private IP: ${PRIVATE_IP}"
