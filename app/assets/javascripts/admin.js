$(document).ready(function(){


	$('#checkout_id').on("click", "a", (function(e){
		e.preventDefault();
	  $('.books_status').hide();
	  $('.books_number').hide();
	  var url = $(this).attr('href');
	 
		$.get(url, function(response){
				var searchResults = $(response).filter(".xhr_book_info")[0];
				$('.book_info').append(searchResults);
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