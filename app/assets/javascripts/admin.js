$(document).ready(function(){


	$('#checkout_id').on("click", "a", (function(e){
		e.preventDefault();
	 
	  $('.books_status').hide();
	  $('.books_number').hide();
	  var url = $(this).attr('href');
	 
		$.get(url, function(response){
				var jqObj = response;
				var searchResults = $(jqObj).find(".header-wrap");
				var x = searchResults['prevObject'][159].remove();
				$('.book_info').append(searchResults['prevObject'][163]);
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