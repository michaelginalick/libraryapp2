$(document).ready(function(){


	$('#checkout_id').on("click", "a", (function(e){
		e.preventDefault();
	 
	  $('.books_status').hide();
	  $('.books_number').hide();
	  var url = $(this).attr('href');
	 
		$.get(url, function(response){
				var jqObj = response;
				var searchResults = $(jqObj).find(".xhr_book_info");
				$('.book_info').append(searchResults['prevObject'][87]);
		 });
		})
	);

	$(document).on("click", "#close", (function(){
		$('.xhr_book_info').hide();
	  $('.books_status').show();
	  $('.books_number').show();
	})
);	

});	