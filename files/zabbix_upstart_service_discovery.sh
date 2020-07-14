#!/bin/bash
# /usr/local/bin/zabbix_upstart_service_discovery.sh
# Discover enabled services on the default runlevel on machines running the upstart init system

service_list=$(chkconfig 2>/dev/null | grep 3:on | awk '{print $1}')

echo -n '{"data":[';for s in ${service_list}; do echo -n "{\"{#SERVICE}\": \"$s\"},";done | sed -e 's:\},$:\}:';echo -n ']}'