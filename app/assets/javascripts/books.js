$(document).ready(function(){
	
		$("#bookSearch").on('keyup', function(e){
			e.preventDefault();
			var searchContent = $('#bookSearch').val();
			if(searchContent.length >= 4) {
				bookSearch(searchContent);
			}	
		});

		var bookSearch = function(searchContent){
			$.ajax({
				type: "GET",
				url: "/books/",
				data: {
					search: searchContent
				},
				success: function(data){
					var jqObj = data;
					var searchResults = $(jqObj).find(".book");
					$("#books").empty().append(searchResults);
				}
			})
		}	
});