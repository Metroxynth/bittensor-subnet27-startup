# Install Bittensor
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/opentensor/bittensor/master/scripts/install.sh)"

# Clone compute-subnet repository
git clone https://github.com/neuralinternet/compute-subnet.git
cd compute-subnet

# Install Python requirements
python3 -m pip install -r requirements.txt

# Install compute-subnet as a package
python3 -m pip install -e .

# Update and install npm
sudo apt update
sudo apt install npm -y

# Install pm2 globally using npm
sudo npm install pm2 -g

# Install required packages for hashcat
wget https://hashcat.net/files/hashcat-6.2.6.tar.gz
tar xzvf hashcat-6.2.6.tar.gz
cd hashcat-6.2.6/
make
make install  # prefixed by sudo if not in the sudoers
hashcat --version

# Install the legacy kernel module flavor
sudo apt-get install -y cuda-drivers

# Allow specific ports through ufw
sudo apt update
sudo apt install ufw -y
sudo ufw allow 12000:12001/tcp
sudo ufw allow 22/tcp
sudo ufw allow ssh
sudo ufw enable