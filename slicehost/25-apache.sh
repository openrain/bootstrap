#
# Ubuntu 8.0.4
#
# Installs Apache
#

apt-get update -y

apt-get install -y apache2 apache2-prefork-dev libapr1-dev 

MODS="rewrite.load proxy.conf proxy.load proxy_balancer.load proxy_http.load"
for mod in $MODS
do
  ln -s /etc/apache2/mods-available/$mod /etc/apache2/mods-enabled/$mod
done

apache2ctl -k graceful