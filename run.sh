#!/bin/bash

function run
{
echo "upstream cluster {"
env | grep PORT_9000_TCP= | awk -F '_' '{print "server "$1":9000;"}'
echo "}"

}

run > /etc/nginx/upstream
nginx
ip a s eth0 | grep inet | awk -F'[\/\t\ ]' '/inet /{print "http://"$6"/index.php"}'
exec /bin/bash
