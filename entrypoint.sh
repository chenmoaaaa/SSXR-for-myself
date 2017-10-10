#!/bin/bash

rm -rf /etc/localtime
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
cd /root/ssr/shadowsocks/ && python /root/ssr/shadowsocks/server.py
 
