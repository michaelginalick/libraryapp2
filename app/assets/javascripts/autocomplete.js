$(document).ready(function(){
	
		$("#bookSearch").autocomplete({
			source: function( request, response) {
			var searchContent = $('#bookSearch').val();
			 $.ajax({
			 	dataType: 'json',
			 	type: "GET",
			 	url: "/books/",
			 	data: {
			 		search: searchContent
			 	},
			 		success: function(data){
			 			response($.each(data, function(key, value) {
			 		}))
			 	}
     })
  	}
  })
});
