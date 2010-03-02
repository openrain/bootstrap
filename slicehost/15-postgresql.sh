#
# Ubuntu 8.0.4
#
# Installs PostgreSQL packages. Installs pg gem if Rubygems is installed
#
# PGPASSWORD=omgpuppies sh 15-setup-postgresql.sh
#

if [ ! -n "$PGPASSWORD" ]
then 
  echo "Must set 'admin' password for PostgreSQL"
  echo "PGPASSWORD=oMglulz `basename $0`"
  exit
fi

apt-get update -y

PG_VER=8.4
PGCONFDIR=/etc/postgresql/$PG_VER/main/

apt-get install -y postgresql-$PG_VER postgresql-server-dev-$PG_VER postgresql-contrib-$PG_VER 

# log and monitoring for pgAdmin
sudo su postgres -c psql < /usr/share/postgresql/$PG_VER/contrib/adminpack.sql

# modify settings
perl -pi.bak -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/gi; \
                 s/#password_encryption/password_encryption/gi" \
                 $PGCONFDIR/postgresql.conf

# add addresses
echo "\
# p \n\
hostssl all     all     68.104.179.220/32       md5 \n\
# m \n\
hostssl all     all     70.162.73.19/32       md5 \n\
# o \n\
hostssl all     all     64.32.165.26/32       md5 \n\
" >> /etc/postgresql/$PG_VER/main/pg_hba.conf

# restart to load changes
pg_ctlcluster $PG_VER main restart

# create an 'admin' PostgreSQL user 
cat > /tmp/postgres.sql <<EOF
CREATE ROLE admin 
  LOGIN ENCRYPTED PASSWORD '$PGPASSWORD' 
  SUPERUSER INHERIT CREATEDB CREATEROLE;
EOF
sudo su postgres -c psql template1 < /tmp/postgres.sql
rm /tmp/postgres.sql

if [ -e "`which gem`" ]
then
  # install pg gem
  gem install pg
fi
