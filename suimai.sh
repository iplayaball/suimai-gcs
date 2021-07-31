#!/bin/bash
##########################################################################
# Author: wdajun
# mail: wangdajunzy@163.com
# Created Time: Mon 26 Jul 2021 03:16:38 PM CST
##########################################################################
#set -e

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
      $dkcpsCmd data.yml up -d
      sh nginx_install.sh

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

