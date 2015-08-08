$(document).ready(function(){
	
		$("#bookSearch").autocomplete({
			source: function( request, response) {
			var searchContent = $('#bookSearch').val();
			$.ajax({
				type: "GET",
				url: "/books/",
				data: {
					search: searchContent
				},
					success: function(data){
						$.each(data, function(key, value) {
							console.log(key + ":" + value)
					})

						},
					'json'
      }
				})
      }
		})
	
});
