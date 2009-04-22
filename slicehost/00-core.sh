#
# Ubuntu 8.0.4
#
# Installs core development packages and users
#

apt-get update -y

apt-get install -y build-essential gcc g++

# setup timezone
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime

# add admin user
export USERNAME=admin
sh add_user.sh
echo "$USERNAME\tALL=(ALL) ALL" >> /etc/sudoers

cd ~
mkdir -p .ssh
touch .ssh/authorized_keys
chmod 700 .ssh/
chmod 600 .ssh/authorized_keys

echo 
echo "Copying authorized_keys"
echo

# TODO Use relative paths instead of absolute. dirname? pwd? 
cp ~/bootstrap/config/root_authorized_keys ~/.ssh/authorized_keys

echo
echo "For security reasons, you must manually set a password for the 'admin' user."
echo