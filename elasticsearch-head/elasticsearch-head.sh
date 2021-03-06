#!/bin/bash
#desc: elasticsearch-head service manager
#date: 2019

data="cd /usr/local/src/elasticsearch-head/; nohup npm run start > /dev/null 2>&1 & "

function START (){
    eval $data && echo -e "elasticsearch-head start\033[32m     ok\033[0m"
}

function STOP (){
    ps -ef |grep grunt |grep -v "grep" |awk '{print $2}' |xargs kill -s 9 > /dev/null && echo -e "elasticsearch-head stop\033[32m      ok\033[0m"
}

case "$1" in
    start)
        START
        ;;
    stop)
        STOP
        ;;
    restart)
        STOP
        sleep 3
        START
        ;;
    *)
        echo "Usage: elasticsearch-head (start|stop|restart)"
        ;;
esac