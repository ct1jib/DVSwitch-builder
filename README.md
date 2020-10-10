# DVSwitch-builder
DVSwitch for raspberry install

RaspBian Strettch 12 min for aquisition
sudo -s
cd /tmp
wget https://raw.githubusercontent.com/ct1jib/DVSwitch-builder/main/dvswitch-builder.sh
chmod +x dvswitch-builder.sh
./dvswitch-builder.sh

*******************
cd /opt/Analog_bridge
mv Analog_Bridge.ini.1 Analog_Bridge.ini
mv dvsm.macro.1 dvsm.macro
cp parrot.sh /opt/MMDVM_Bridge
wget <update> 
