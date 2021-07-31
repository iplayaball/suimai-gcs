#!/bin/bash
##########################################################################
# Author: wangdj
# mail: wangdajunzy@163.com
# Created Time: Thu 15 Jul 2021 02:50:16 PM CST
##########################################################################

okdir='/home/' && ! [[ $HOME =~ "$okdir" ]] && echo "not $HOME =~ $okdir" && exit

if ps -ef |grep -v grep |grep -q suimai-admin-vue; then
  echo "suimai-admin-vue already start"
else
  cd $HOME/suimai-admin-vue
  (npm run dev &>/root/suimai_admin_vue.log &)
fi

if netstat -anput |grep -q :8088; then
  echo "nginx already start at port 8088"
else
  apt-get install nginx -y
  sed -i  '/sites-enabled/ s/^/#/' /etc/nginx/nginx.conf
  ln -sf $HOME/gcs-suimai/nginx/vue.conf /etc/nginx/conf.d/vue.conf
  ln -sf $HOME/gcs-suimai/nginx/user.conf /etc/nginx/conf.d/user.conf
  nginx
fi

