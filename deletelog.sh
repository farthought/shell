#!/bin/bash 

#************************************************#
#* delete system log file
#* in_log_path:the path that the log files locate
#* in_day_num:the deadline needed to delete the log files before
#************************************************#
in_log_path=${1}
in_day_num=${2}

#************用于记录删除系统日志的时间的日志***********
log_delete="/var/log/deletelog/`date +%Y%m`.log"

#************删除日志函数*******************************
function deleteLog()
{
	echo "deletelog"
	inner_num=${1}
	#find log
	echo "[`date`] >> start delete log files..." >> ${log_delete}
	find ${in_log_path} -type f -mtime ${in_day_num} -print0 | xargs -0 rm -rf
	echo "[`date`] >> end delete log files." >> ${log_delete}
	echo "deletelogend"
}

function init()
{
	echo "init"
	if [ ! -e /var/log/deletelog ];then
		mkdir -p /var/log/deletelog
	fi
	echo "initend"
}

function main()
{
	echo "main"
	init
	if [ -z ${in_log_path} ];then
		echo "[`date`] >> error:log path not init..." >> ${log_delete}
		return 
	fi
	inner_num=+7
	if [ -n ${in_day_num} -a ${in_day_num} -ge 1 ];then
		inner_num=${in_day_num}
	fi
	deleteLog ${inner_num}
	echo "mainend"
}

main



