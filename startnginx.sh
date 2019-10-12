#!/bin/bash
# chkconfig：2345 88 89
# descripton： this is a nginx script
start() {
        /usr/local/nginx/sbin/nginx
        }
stop() {
        /usr/local/nginx/sbin/nginx -s stop
        }
status() {
        if [ -f /usr/local/nginx/logs/nginx.pid ];then
                pid='cat /usr/local/nginx/logs/nginx.pid'
                echo "Nginx(${pid}) is Running ..."
        else
                echo "Nginx is Dead"
        fi
        }
case $1 in
start)
        start;;
stop)
        stop;;
restart)
        stop
        start;;
status)
        status;;
*)
        echo "Usage:$0 (start|stop|restart)"
        ;;
esac
