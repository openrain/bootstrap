#
# Ubuntu 8.0.4
#
# Create users
#

if [ ! -n "$USERNAME" ]
then
  echo "Must set the username"
  echo "USERNAME=mchung sh `basename $0`"
  exit
fi

useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME

mkdir /home/$USERNAME/.ssh
cp ~/bootstrap/config/default_authorized_keys /home/$USERNAME/.ssh/authorized_keys
chmod 700 /home/$USERNAME/.ssh/
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh/
