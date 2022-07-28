const http = require('http');
const Express = require("express");
const path = require('path');

const port = process.env.PORT || 7010;

const app = Express();
const server = http.createServer(app);

server.listen(port, function () {
    console.log(`Server listening on port ${port}`);
});

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, "build", "index.html"));
});

app.use(Express.static(path.join(__dirname, "build")));

module.exports = server;
