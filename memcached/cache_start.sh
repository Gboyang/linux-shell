#!/bin/sh
#
. /etc/init.d/functions
#
OPTIONS="-d -m 2048 -l 127.0.0.1 -p 11211 -u root -c 20000 -P /var/run/memcached"
RETVAL=0
prog="memcached"

start() {
        echo -n $"Starting $prog: "
        if [ $UID -ne 0 ]; then
                RETVAL=1
                failure
        else
                daemon /usr/sbin/memcached $OPTIONS
                RETVAL=$?
                [ $RETVAL -eq 0 ] && touch /var/lock/subsys/memcached
        fi;
        echo 
        return $RETVAL
}

stop() {
        echo -n $"Stopping $prog: "
        if [ $UID -ne 0 ]; then
                RETVAL=1
                failure
        else
                killproc /usr/sbin/memcached
                RETVAL=$?
                [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/memcached
        fi;
        echo
        return $RETVAL
}

reload(){
        echo -n $"Reloading $prog: "
        killproc /usr/sbin/memcached -HUP
        RETVAL=$?
        echo
        return $RETVAL
}

restart(){
	stop
	start
}

condrestart(){
    [ -e /var/lock/subsys/memcached ] && restart
    return 0
}

case "$1" in
  start)
	start
	;;
  stop)
	stop
	;;
  restart)
	restart
        ;;
#  reload)
#	reload
#        ;;
  condrestart)
	condrestart
	;;
  status)
        status memcached
	RETVAL=$?
        ;;
  *)
	echo $"Usage: $0 {start|stop|status|restart|condrestart}"
	RETVAL=1
esac

exit $RETVAL