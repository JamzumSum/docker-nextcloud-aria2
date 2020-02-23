#!/bin/sh
### BEGIN INIT INFO
# Provides:          Aria2c
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Aria2c rpc service
# Description:       Start the Aria2c service and associated helpers
### END INIT INFO
do_start() {
	aria2c --conf-path /root/aria2/aria2.conf
}

do_stop() {
	pkill -f aria2c
}

do_restart() {
	do_stop
	sleep 1
	do_start
}

case "$1" in
start)
	do_start
	;;
stop)
	do_stop
	;;
status)
	exit $?
	;;
restart|reload)
	do_restart
	;;
*)
	echo "Usage: {start|stop|restart|reload}" >&2
	exit 3
	;;
esac

exit 0
