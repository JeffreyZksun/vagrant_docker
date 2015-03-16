var express = require('express');
var http = require('http');

var expressApp = express();
expressApp.use(express.static(__dirname + ''));

expressApp
	.get('/', function(req, res, next){res.send("hello world");})
	.get('/crash', function(){process.exit(1);}); // test the restart on crash.

var listeningPort = 80;
http.createServer(expressApp).listen(listeningPort)

console.log('Server is listening on port ' + listeningPort);