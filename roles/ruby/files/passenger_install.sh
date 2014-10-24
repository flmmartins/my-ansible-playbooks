#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Error - use passenger version argument for the script"
  exit 1
fi

version=$1

echo "Begging passenger $version installation"

cd /opt/passenger
wget http://s3.amazonaws.com/phusion-passenger/releases/passenger-$version.tar.gz

tar xzvf /opt/passenger/passenger-$version.tar.gz
cd /opt/passenger/passenger-$version

echo "Installing passenger-install-nginx-module "
./bin/passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx --extra-configure-flags=none --languages=ruby

if [ ! -d "/opt/nginx/conf" ]; then
  echo "Installation failure"
  exit 1
fi

echo "Installation sucess!"
exit 0
