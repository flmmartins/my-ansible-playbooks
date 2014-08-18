#/bin/bash

if [ $# -ne 1 ]; then
  echo "Error - setup_nginx.sh requires one argument for role"
  exit 1
fi
template="/tmp/nginx.conf"
nginxtemp1="/tmp/nginx_tmp1.conf"
nginxtemp2="/tmp/nginx_tmp2.conf"
result="/tmp/nginx_final.conf"
nginxconf="/opt/nginx/conf/nginx.conf"

echo "Server Role is $1"
echo "Server Name will be $HOSTNAME in nginx.conf"

sed -e "s/SERVER_NAME_1/$HOSTNAME.thoughtworks.com/g" $template > $nginxtemp1
sed -e "s/SERVER_NAME_2/www.$HOSTNAME.thoughtworks.com/g" $nginxtemp1 > $nginxtemp2
sed -e "s/SERVER_ROLE/$1/g" $nginxtemp2 > $result

cp -f $result $nginxconf
rm -f "/tmp/nginx*"
exit 0
