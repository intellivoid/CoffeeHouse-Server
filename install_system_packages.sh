# This script is used to simply install the required packages
# for CoffeeHouse-Server to install correctly.

apt update
apt -y upgrade
apt -y install python3 python3-distutils wget curl
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
rm get-pip.py