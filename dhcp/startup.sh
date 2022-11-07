#!/bin/bash

apt-get update -y
apt-get install -y isc-dhcp-server
echo "Aguardando"
sleep 3
echo "Finalizado"
/etc/init.d/isc-dhcp-server restart
