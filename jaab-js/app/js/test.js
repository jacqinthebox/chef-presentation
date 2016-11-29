$(document).ready(function() {
    $.ajax({
        url: "http://localhost:3000/addressentry"
    }).then(function(data) {
       
        var strHTML = "<table class=\"table table-striped table-responsive\">";
        strHTML += "<tr><th>Voornaam</th><th>achternaam</th><th>Company</th><th>Afdeling</th><th>Adres</th><th>Plaats</th><th>Land</th><th>www</th></tr>";
    	
    	$.each(data.addressentries, function (key, val) {
            console.log(val);           
    	       strHTML += "<tr>";
               strHTML += "<td>" + val.firstname + "</td>";
               strHTML += "<td>" + val.lastname + "</td>";
               strHTML += "<td>" + val.companyname + "</td>";
               strHTML += "<td>" + val.departmentname + "</td>";
               strHTML += "<td>" + val.address + "</td>";
               strHTML += "<td>" + val.city + "</td>";
               strHTML += "<td>" + val.country + "</td>";
               strHTML += "<td>" + val.www + "</td>";
               strHTML += "</tr>";
    		
    		

        });
    	strHTML += "</table>";
        $('#adreskaarten').append (strHTML );
    });

   
});

