apt update -y
apt upgrade -y
apt install nodejs -y
apt install npm -y

apt-get install certbot -y
certbot certonly --standalone

cd ~/
