#!/bin/bash
##########################################################################
# Author: wangdj
# mail: wangdajunzy@163.com
# Created Time: Fri 30 Jul 2021 02:43:21 PM CST
##########################################################################
set -x

suimai=$HOME/suimai

declare -A names
names=(
["member"]="member"
["order"]="order"
["product"]="product"
["renren"]="renren-fast"
["auth"]="suimai-auth-server"
["gateway"]="suimai-gateway"
["search"]="suimai-search"
["third-party"]="suimai-third-party"
)
#echo ${m_dict[key1]}
#echo ${names[$1]}
for i in $*; do
  ! [[ ${names[@]} =~ "$i" ]] && echo $i error && exit
done

for i in $*; do
  docker stop $i
done

cd $suimai
git pull

for i in $*; do
  cd $suimai/${names[$i]}
  mvn clean package
  docker start $i
done

