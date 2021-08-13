#!/bin/bash
##########################################################################
# Author: wdajun
# mail: wangdajunzy@163.com
# Created Time: Mon 26 Jul 2021 03:16:38 PM CST
##########################################################################
#set -e

st=80
dkcpsCmd="docker-compose --compatibility -f"

cd $HOME/gcs-suimai/main/
. ./yml.cfg


if [ -z "$1" ]; then
  echo "usage: begin|docker-compose"
#elif [ "$#" -eq 1 ]; then
else
  case "$1" in
    begin)
      $dkcpsCmd nacosnew.yml up -d
      sys_date1=$(date +%s)

      $dkcpsCmd data.yml up -d
      sh nginx_install.sh
      
      sys_date2=$(date +%s)
      sys_date2=$(date +%s)
      time=`expr $sys_date2 - $sys_date1`
      etime=$(($st-$time))
      [ $etime -gt 0 ] && echo "还需要等待 $etime 后才能注册到nacoas " && sleep $etime

      $dkcpsCmd docker-compose.yml up -d
      ;;
    upd)
      $dkcpsCmd docker-compose.yml up -d
      ;;
    end)
      $dkcpsCmd docker-compose.yml down
      $dkcpsCmd data.yml down
      $dkcpsCmd nacosnew.yml down
      ;;
    #stop)
    #  $dkcpsCmd docker-compose.yml stop
    #  ;;
    #down)
    #  $dkcpsCmd docker-compose.yml down
    #  ;;
    *)
      $dkcpsCmd docker-compose.yml $*
  esac
fi

