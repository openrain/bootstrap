#
# Ubuntu 8.0.4
#
# Installs ImageMagick. Installs rmagick gem if Rubygems is installed
#

apt-get update -y

apt-get install -y imagemagick libmagick9-dev 

if [ -e "`which gem`" ]
then
  gem install rmagick
fi
