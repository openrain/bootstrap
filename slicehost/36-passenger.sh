#
# Ubuntu 8.0.4
#
# Installs Phusion Passenger (mod_rails). 
# Also adds a user called "app" that your Rails application runs as
#

PASSENGER_VER=2.2.11

if [ ! -n "$SERVERNAME" ]
then 
  echo "Must set 'ServerName' for Apache"
  echo "SERVERNAME=example.com `basename $0`"
  exit
fi

export USERNAME=app
sh add_user.sh
gem install passenger -v $PASSENGER_VER
passenger-install-apache2-module -a

echo "\
ServerName $SERVERNAME

LoadModule passenger_module /usr/local/lib/ruby/gems/1.8/gems/passenger-$PASSENGER_VER/ext/apache2/mod_passenger.so
PassengerRoot /usr/local/lib/ruby/gems/1.8/gems/passenger-$PASSENGER_VER
PassengerRuby /usr/local/bin/ruby
" >> /etc/apache2/apache2.conf
