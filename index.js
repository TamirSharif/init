const express = require('express');
const http = require('http');
const https = require('https');
const path = require('path');
const fs = require('fs');



// Initiallising Express ======================================================
const app = express();

// HTTPS Certificate ==========================================================

const projectName = 'ENTER_NAME_OF_PROJECT';


const privateKey = fs.readFileSync('/etc/letsencrypt/live/' + projectName + '.tamir.uk/privkey.pem', 'utf8');
const certificate = fs.readFileSync('/etc/letsencrypt/live/' + projectName + '.tamir.uk/cert.pem', 'utf8');
const ca = fs.readFileSync('/etc/letsencrypt/live/' + projectName + '.tamir.uk/chain.pem', 'utf8');

const credentials = {
    key: privateKey,
    cert: certificate,
    ca: ca
};
// Middleware =================================================================
app.use(function (req, res, next) {
    if (req.secure) {
        next();
    } else {
        res.redirect('https://' + req.headers.host + req.url);
    }
});

app.use(express.static('public'));

app.use(express.urlencoded({
    extended: false
}));

// Main Page ==================================================================
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname + 'web/index.html'));
    //res.send('<h1>Hello World</h1>'); //If you want to just send plain Text
});


// 404 Page ===================================================================
app.use((req, res, next) => {
    res.status(404).send('<h1>404</h1><h4>Page not found</h4>');
})
// Starting the website =======================================================
const httpServer = http.createServer(app);
const httpsServer = https.createServer(credentials, app);

httpServer.listen(80, () => {
    console.log('HTTP Server running on port 80');
});

httpsServer.listen(443, () => {
    console.log('HTTPS Server running on port 443');
});
