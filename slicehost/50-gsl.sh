#
# Ubuntu 8.0.4
#
# Installs GSL with Ruby bindings
#

apt-get update -y

apt-get install -y gsl-bin libgsl0-dev

# Download GSL from source, compile, and install.
GSL_VER=1.10.3
GSL_PKG=rb-gsl-$GSL_VER
GSL_URL=http://rubyforge.org/frs/download.php/28909/$GSL_PKG.tar.gz

cd /usr/local/src
wget $GSL_URL
tar zxvf $GSL_PKG.tar.gz
cd $GSL_PKG

ruby setup.rb config
ruby setup.rb setup
ruby setup.rb install
