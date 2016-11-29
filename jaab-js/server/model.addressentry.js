var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var AddressEntry = new Schema({
  uuid: {
    type: String,
    required: false
  },
  
  firstname : String,
  lastname : String,
  companyname : String,
  departmentname : String,
  address : String,
  city : String,
  country: String,
  postalcode: String,
  email: String,
  phone: String,
  www: String

});

module.exports = mongoose.model('AddressEntry', AddressEntry);
