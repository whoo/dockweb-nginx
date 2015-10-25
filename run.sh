#!/bin/bash

function run
{
echo "upstream cluster {"
env | grep PORT_9000_TCP= | awk -F '_' '{print "server "$1":9000;"}'
echo "}"

}

function serv
{
env | grep _NAME | awk -F= '{print $2}'
}

run > /etc/nginx/upstream
serv > /var/www/html/serv
nginx
ip a s eth0 | grep inet | awk -F'[\/\t\ ]' '/inet /{print "http://"$6"/index.php"}'
exec /bin/bash
