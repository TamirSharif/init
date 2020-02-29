echo -e "\e[42mUpdating Software\e[0m"
apt update -y
apt upgrade -y

echo -e "\e[42mInstalling Node and NPM\e[0m"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install nodejs -y

echo -e "\e[42mInstalling Certbot (For adding HTTPS certificates)\e[0m"
apt-get install certbot -y
certbot certonly --standalone

echo -e "\e[42mInstalling Nodemon\e[0m"
npm install -g nodemon


echo -e "\e[42mWhat is the name of your project?\e[0m"
read projectName

cd ~/
mkdir $projectName

cd $projectName

mkdir public
cd public
mkdir css
mkdir js
mkdir images
cd ~/$projectName
mkdir web

npm init -y
npm install express http https path fs --save

echo -e "\e[42mAdding Hello World index.js file\e[0m"
cp ~/init/index.js ~/$projectName/index.js
cp ~/init/index.html ~/$projectName/web/index.html
cd ~/
rm init -r

echo -e "\e[42mInstalled:"
echo -e "\e[0m    ★ Node.js\n    ★ NPM\n    ★ Certbot\n    ★ Nodemon\n    ★ Express"
echo "A 'Hello World' index.js file has also been added. Enter a HTTPS Certificate location and download all the required modules"


