
cp ~/init/index.js ~/index.js
cd ~/
npm install -g nodemon

echo -e "\e[42mInstalled:"
echo -e "\e[0m    ★ Node.js\n    ★ NPM\n    ★ Certbot\n    ★ Nodemon"
echo "A 'Hello World' index.js file has also been added. Enter a HTTPS Certificate location and download all the required modules"

rm init -r
