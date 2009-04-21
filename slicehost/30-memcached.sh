#
# Ubuntu 8.0.4
#
# Installs memcached. Installs memcache-client gem if Rubygems is installed
#

apt-get update -y

apt-get install -y memcached

if [ -e "`which gem`" ]
then
  gem install memcache-client
fi