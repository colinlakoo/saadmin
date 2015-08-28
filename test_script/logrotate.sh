#!/bin/sh
DATE=`date +%F`
#LOG_DIR='/usr/local/nginx/logs'
LOG_DIR='/home/colin/colin_script/test_script'

####move log to file with date  
File_list=`ls $LOG_DIR/*.log`

for f in $File_list;do
	mv $f $f.$DATE
done

####recreate new log
#kill -USR1 `cat $LOG_DIR/nginx.pid`
sleep 1

for f in $File_list;do
	gzip $f.$DATE
done

####remove old log
#Oldfile=$LOG_DIR/*.log.$(date +%y%m%d --date='30 days ago').gz

#echo $Oldfile;
