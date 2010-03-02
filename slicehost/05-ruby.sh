#
# Ubuntu 8.0.4
#
# Compiles Ruby 1.8.7-p72 and Rubygems 1.3.2 from source
#

apt-get update -y

apt-get install -y libssl-dev libreadline5-dev zlib1g-dev

# Download Ruby from source, compile, and install.
RUBY_VER=1.8.7-p174
RUBY_PKG=ruby-$RUBY_VER
RUBY_URL=ftp://ftp.ruby-lang.org/pub/ruby/1.8/$RUBY_PKG.tar.gz

cd /usr/local/src
wget $RUBY_URL
tar zxvf $RUBY_PKG.tar.gz
cd $RUBY_PKG

./configure --prefix=/usr/local --with-openssl-dir=/usr --with-readline-dir=/usr --with-zlib-dir=/usr
make -j4
make install

# Download Rubygems from source, compile, and install
RUBYGEM_VER=1.3.6
ASSET_ID=69365
RUBYGEM_PKG=rubygems-$RUBYGEM_VER
RUBYGEM_URL=http://rubyforge.org/frs/download.php/$ASSET_ID/$RUBYGEM_PKG.tgz

cd /usr/local/src
wget $RUBYGEM_URL
tar zxvf $RUBYGEM_PKG.tgz
cd $RUBYGEM_PKG

ruby setup.rb
