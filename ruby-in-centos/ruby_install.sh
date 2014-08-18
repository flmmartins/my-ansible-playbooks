#!/usr/bin/env bash

if [ $# -ne 2 ]; then
   echo "Error - ruby_install.sh requires two arguments: "
   echo "ruby_install.sh <ruby-version> <rubygems-version>"
   exit 1
fi

echo "Beggining installation"

version=$1
folder_version=${version:0:3}

#Ruby
cd /usr/local/src
#mkdir $HOME/ruby
wget ftp://ftp.ruby-lang.org/pub/ruby/$folder_version/ruby-$version.tar.gz 
tar zxvf ruby-$version.tar.gz
cd ruby-$version
#./configure --prefix=$HOME/ruby
./configure
make
make install
 
# ruby-gems
version=$2
cd ..
wget http://production.cf.rubygems.org/rubygems/rubygems-$version.tgz
tar zxvf rubygems-$version.tgz
cd rubygems-$version

#export GEM_HOME=$HOME/gems
#$HOME/ruby/bin/ruby setup.rb

/usr/local/bin/ruby setup.ruby
exit 0
