echo -e "\e[42mUpdating Software"
echo -e "\e[0m"
apt update -y
apt upgrade -y

echo -e "\e[42mInstalling Node and NPM"
echo -e "\e[0m"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt install nodejs -y

echo -e "\e[42mInstalling Certbot (For adding HTTPS certificates)"
echo -e "\e[0m"
apt-get install certbot -y
echo -e "\e[42mPlease enter your infor"
echo -e "\e[0m"
certbot certonly --standalone

echo -e "\e[42mAdding Hello World index.js file"
echo -e "\e[0m"
cp ~/init/index.js ~/index.js
cd ~/

echo -e "\e[42mInstalling Nodemon"
echo -e "\e[0m"
npm install -g nodemon
echo -e "\e[42mInstalling react app generation tool"
echo -e "\e[0m"
npm install -g create-react-app

echo -e "\e[42mInstalled:"
echo -e "\e[0m    ★ Node.js\n    ★ NPM\n    ★ Certbot\n    ★ Nodemon"
echo "A 'Hello World' index.js file has also been added. Enter a HTTPS Certificate location and download all the required modules"

rm init -r
