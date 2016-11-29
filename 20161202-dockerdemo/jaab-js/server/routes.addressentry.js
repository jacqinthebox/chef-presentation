var addressentries = require('./controller.addressentry');
 
module.exports = function (app) {
    app.route('/addressentry').post(addressentries.create);
    /*app.route('/food').get(foodstuff.list);
    app.route('/food/:id').get(foodstuff.findOne);
    app.route('/foodname/:name').get(foodstuff.findByName); */
};