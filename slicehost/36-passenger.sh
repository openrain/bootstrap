#
# Ubuntu 8.0.4
#
# Installs Phusion Passenger (mod_rails). 
# Also adds a user called "app" that your Rails application runs as
#

export USERNAME=app
sh add_user.sh
gem install passenger
passenger-install-apache2-module
