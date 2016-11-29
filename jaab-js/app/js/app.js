new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue.js!'
  }
})


var adreskaarten = new Vue({
	  el: '#adreskaarten',
	  data: {
	    adreskaarten: []
	  },
	  ready: function() {
	    var that;
	    that = this;
	    $.ajax({
	      
	    	 type: "GET",
	     	 url: 'http://localhost:3000/addressentries',
	         dataType: 'json',
	         success: function (res){
	  	        that.adreskaarten = res.addressentries;
	         }
	    });
	  }
});