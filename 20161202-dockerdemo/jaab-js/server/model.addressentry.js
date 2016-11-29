var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var AddressEntry = new Schema({
  uuid: {
    type: String,
    required: false
  },
  
  fullname : String,
  searchname : String,
  streetaddres: String,
  postalcode: String,
  city: String,
  country: String,
  email: String,
  phone: String,
  www: String

});

module.exports = mongoose.model('AddressEntry', AddressEntry);
