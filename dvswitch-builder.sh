#!/usr/bin/env bash
set -o errexit

# N4IRS 02/10/2020
# CT1JIB 10/10/2020

#################################################
#                                               #
#   Build a DVSwitch DMR Only on a clean disk   #
#                                               #
#################################################

# Install DVSwitch Repository
cd /tmp

wget http://dvswitch.org/install-dvswitch-repo
chmod +x install-dvswitch-repo
./install-dvswitch-repo

# Install needed programs
# This could be pruned
#
apt-get update -y
apt-get install git -y
apt-get install curl -y
apt-get install g++ -y
apt-get install make -y
apt-get install jq -y
apt-get install qemu -y
apt-get install build-essential -y
apt-get install libwxgtk3.0-dev -y
apt-get install portaudio19-dev -y
apt-get install libusb-1.0-0-dev -y
apt-get install python-serial -y
apt-get install dvswitch -y

# For Armbian Need to check this !
apt-get install libstdc++-arm-none-eabi-newlib -y
cd /opt/MMDVM_Bridge
wget https://raw.githubusercontent.com/DVSwitch/MMDVM_Bridge/master/dvswitch.sh
chmod +x dvswitch.sh.1
mv dvswitch.sh.1 dvswitch.sh
wget -O MMDVM_Bridge https://github.com/DVSwitch/MMDVM_Bridge/raw/master/bin/MMDVM_Bridge.armhf
cd /opt/Analog_Bridge
wget -O Analog_Bridge https://github.com/DVSwitch/Analog_Bridge/raw/master/bin/Analog_Bridge.armhf
# chmod +x Analog_Bridge
wget https://github.com/DVSwitch/Analog_Bridge/raw/master/dvsm.macro
wget https://github.com/DVSwitch/Analog_Bridge/raw/master/Analog_Bridge.ini
mv Analog_Bridge.ini.1 Analog_Bridge.ini
mv dvsm.macro.1 dvsm.macro
chmod +x dvsm.macro
cp parrot.sh /opt/MMDVM_Bridge
cd /tmp
wget https://raw.githubusercontent.com/ct1jib/DVSwitch-builder/main/DMRIDUpdateBM.sh
chmod +x DMRIDUpdateBM.sh
cp DMRIDUpdateBM.sh /usr/local/sbin
# /usr/local/sbin/DMRIDUpdateBM.sh
ln -s /usr/local/sbin/DMRIDUpdateBM.sh /etc/cron.daily



# Add DVSwitch programs via apt-get install

