#
# Ubuntu 8.0.4
#
# Installs miscellaneous packages (Ubuntu / Rubygems)
#

apt-get update -y

apt-get install -y locate git-core git-doc tree emacs22-nox screen nmap sqlite3 libsqlite3-dev libxml2 libxml2-dev libxslt1.1 libxslt1-dev 

updatedb

gem update

gem install rake hpricot rack libxml-ruby nokogiri
