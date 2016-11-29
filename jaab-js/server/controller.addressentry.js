//mongodb
var mongoose = require('mongoose');
var AddressEntry = require('./model.addressentry');


exports.create = function (req, res) {
    var address = new AddressEntry(req.body);
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

exports.list = function (req, res) {
    AddressEntry.find(function (err, data) {
        if (err) {
            res.send(err);
        }
        res.json({
            success: true,
            addressentries: data
        });
    });
};

exports.seed = function() {

  AddressEntry.find({}).exec(function(err,collection) {

    if(collection.length === 0) {
        
            AddressEntry.create({firstname: 'James', lastname: 'Butt', companyname: 'Commercial Press',departmentname: 'Finance',address: '6649 N Blue Gum St', city: 'New Orleans',country: 'Orleans', email: 'jbutt@gmail.com',www: 'http://www.bentonjohnbjr.com' });
            AddressEntry.create({firstname: 'Josephine', lastname: 'Darakjy', companyname: 'Commercial Press',departmentname: 'Finance',address: '4 B Blue Ridge Blvd', city: 'Brighton',country: 'Livingston', email: 'josephine_darakjy@darakjy.org',www: 'http://www.chanayjeffreyaesq.com' });
            AddressEntry.create({firstname: 'Art', lastname: 'Venere', companyname: 'Commercial Press',departmentname: 'Finance',address: '8 W Cerritos Ave #54', city: 'Bridgeport',country: 'Gloucester', email: 'art@venere.org',www: 'http://www.chemeljameslcpa.com' });
            AddressEntry.create({firstname: 'Lenna', lastname: 'Paprocki', companyname: 'Commercial Press',departmentname: 'Finance',address: '639 Main St', city: 'Anchorage',country: 'Anchorage', email: 'lpaprocki@hotmail.com',www: 'http://www.feltzprintingservice.com' });
            AddressEntry.create({firstname: 'Donette', lastname: 'Foller', companyname: 'Commercial Press',departmentname: 'Finance',address: '34 Center St', city: 'Hamilton',country: 'Butler', email: 'donette.foller@cox.net',www: 'http://www.printingdimensions.com' });
            AddressEntry.create({firstname: 'Simona', lastname: 'Morasca', companyname: 'Commercial Press',departmentname: 'Finance',address: '3 Mcauley Dr', city: 'Ashland',country: 'Ashland', email: 'simona@morasca.com',www: 'http://www.chapmanrosseesq.com' });
            AddressEntry.create({firstname: 'Mitsue', lastname: 'Tollner', companyname: 'Commercial Press',departmentname: 'Finance',address: '7 Eads St', city: 'Chicago',country: 'Cook', email: 'mitsue_tollner@yahoo.com',www: 'http://www.morlongassociates.com' });
            AddressEntry.create({firstname: 'Leota', lastname: 'Dilliard', companyname: 'Commercial Press',departmentname: 'Finance',address: '7 W Jackson Blvd', city: 'San Jose',country: 'Santa Clara', email: 'leota@hotmail.com',www: 'http://www.commercialpress.com' });
            AddressEntry.create({firstname: 'Sage', lastname: 'Wieser', companyname: 'Commercial Press',departmentname: 'Finance',address: '5 Boston Ave #88', city: 'Sioux Falls',country: 'Minnehaha', email: 'sage_wieser@cox.net',www: 'http://www.truhlarandtruhlarattys.com' });
            AddressEntry.create({firstname: 'Kris', lastname: 'Marrier', companyname: 'Commercial Press',departmentname: 'Finance',address: '228 Runamuck Pl #2808', city: 'Baltimore',country: 'Baltimore City', email: 'kris@gmail.com',www: 'http://www.kingchristopheraesq.com' });
            AddressEntry.create({firstname: 'Minna', lastname: 'Amigon', companyname: 'Commercial Press',departmentname: 'Finance',address: '2371 Jerrold Ave', city: 'Kulpsville',country: 'Montgomery', email: 'minna_amigon@yahoo.com',www: 'http://www.dorljamesjesq.com' });
            AddressEntry.create({firstname: 'Abel', lastname: 'Maclead', companyname: 'Commercial Press',departmentname: 'Finance',address: '37275 St  Rt 17m M', city: 'Middle Island',country: 'Suffolk', email: 'amaclead@gmail.com',www: 'http://www.rangoniofflorence.com' });
            AddressEntry.create({firstname: 'Kiley', lastname: 'Caldarera', companyname: 'Commercial Press',departmentname: 'Finance',address: '25 E 75th St #69', city: 'Los Angeles',country: 'Los Angeles', email: 'kiley.caldarera@aol.com',www: 'http://www.feinerbros.com' });
            AddressEntry.create({firstname: 'Graciela', lastname: 'Ruta', companyname: 'Commercial Press',departmentname: 'Finance',address: '98 Connecticut Ave Nw', city: 'Chagrin Falls',country: 'Geauga', email: 'gruta@cox.net',www: 'http://www.buckleymillerwright.com' });
            AddressEntry.create({firstname: 'Cammy', lastname: 'Albares', companyname: 'Commercial Press',departmentname: 'Finance',address: '56 E Morehead St', city: 'Laredo',country: 'Webb', email: 'calbares@gmail.com',www: 'http://www.rousseauxmichaelesq.com' });
            AddressEntry.create({firstname: 'Mattie', lastname: 'Poquette', companyname: 'Commercial Press',departmentname: 'Finance',address: '73 State Road 434 E', city: 'Phoenix',country: 'Maricopa', email: 'mattie@aol.com',www: 'http://www.centurycommunications.com' });
            AddressEntry.create({firstname: 'Meaghan', lastname: 'Garufi', companyname: 'Commercial Press',departmentname: 'Finance',address: '69734 E Carrillo St', city: 'Mc Minnville',country: 'Warren', email: 'meaghan@hotmail.com',www: 'http://www.boltonwilburesq.com' });
            AddressEntry.create({firstname: 'Gladys', lastname: 'Rim', companyname: 'Commercial Press',departmentname: 'Finance',address: '322 New Horizon Blvd', city: 'Milwaukee',country: 'Milwaukee', email: 'gladys.rim@rim.org',www: 'http://www.tmbyxbeecompanypc.com' });
            AddressEntry.create({firstname: 'Yuki', lastname: 'Whobrey', companyname: 'Commercial Press',departmentname: 'Finance',address: '1 State Route 27', city: 'Taylor',country: 'Wayne', email: 'yuki_whobrey@aol.com',www: 'http://www.farmersinsurancegroup.com' });
            AddressEntry.create({firstname: 'Fletcher', lastname: 'Flosi', companyname: 'Commercial Press',departmentname: 'Finance',address: '394 Manchester Blvd', city: 'Rockford',country: 'Winnebago', email: 'fletcher.flosi@yahoo.com',www: 'http://www.postboxservicesplus.com' });
            AddressEntry.create({firstname: 'Bette', lastname: 'Nicka', companyname: 'Commercial Press',departmentname: 'Finance',address: '6 S 33rd St', city: 'Aston',country: 'Delaware', email: 'bette_nicka@cox.net',www: 'http://www.sportenart.com' });
            AddressEntry.create({firstname: 'Veronika', lastname: 'Inouye', companyname: 'Commercial Press',departmentname: 'Finance',address: '6 Greenleaf Ave', city: 'San Jose',country: 'Santa Clara', email: 'vinouye@aol.com',www: 'http://www.cnetworkinc.com' });
            AddressEntry.create({firstname: 'Willard', lastname: 'Kolmetz', companyname: 'Commercial Press',departmentname: 'Finance',address: '618 W Yakima Ave', city: 'Irving',country: 'Dallas', email: 'willard@hotmail.com',www: 'http://www.ingallsdonaldresq.com' });
            AddressEntry.create({firstname: 'Maryann', lastname: 'Royster', companyname: 'Commercial Press',departmentname: 'Finance',address: '74 S Westgate St', city: 'Albany',country: 'Albany', email: 'mroyster@royster.com',www: 'http://www.franklinpeterlesq.com' });
            AddressEntry.create({firstname: 'Alisha', lastname: 'Slusarski', companyname: 'Commercial Press',departmentname: 'Finance',address: '3273 State St', city: 'Middlesex',country: 'Middlesex', email: 'alisha@slusarski.com',www: 'http://www.wtlzpowerfm.com' });
            AddressEntry.create({firstname: 'Allene', lastname: 'Iturbide', companyname: 'Commercial Press',departmentname: 'Finance',address: '1 Central Ave', city: 'Stevens Point',country: 'Portage', email: 'allene_iturbide@cox.net',www: 'http://www.ledeckydavidesq.com' });
    }
  })
}



