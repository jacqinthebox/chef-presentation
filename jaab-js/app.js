var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var mongoose = require('mongoose');

app.use(bodyParser.urlencoded({
  extended: true
}));

app.use(bodyParser.json());

app.use(express.static(__dirname + '/app'));

require('./server/routes.addressentry')(app);
mongoose.connect('mongodb://dbserver:27017/jaab');

var address = require('./server/controller.addressentry');
address.seed();

app.set('port', process.env.PORT || 3000);
app.listen(app.get('port'));
console.log("the server is running on http://localhost:" + app.get('port'));
