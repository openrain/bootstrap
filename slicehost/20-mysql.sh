#
# Ubuntu 8.0.4
#
# Installs MySQL packages. Installs MySQL gem if Rubygems is installed
#
# TODO: How to set root password non-interactively?
#

apt-get update -y

MY_VER=5.0

apt-get install -y mysql-server-$MY_VER mysql-client-$MY_VER libmysqlclient15-dev

if [ -e "`which gem`" ]
then
  # install mysql gem
  gem install mysql
fi

# TODO: Create a default cnf file
# sudo cp custom.cnf /etc/mysql/my.cnf

# restart to load changes
/etc/init.d/mysql restart