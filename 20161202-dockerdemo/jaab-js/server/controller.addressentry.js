//mongodb
var mongoose = require('mongoose');
var AddressEntry = require('./model.addressentry');


exports.create = function (req, res) {
    var address = new AddressEntry(req.body);
    console.log(req.body);
    address.save(function (err) {
        if (err) {
            return res.send({
                message: err
            });
        } else {
            res.send({
                success: true,
                address: address
            });
        }
    });
};
