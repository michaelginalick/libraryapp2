$(document).ready(function(){

	$('#phone').keypress(function(event){
			if(event.which != 8 && isNaN(String.fromCharCode(event.which)) || event.keycode == 32) {
				event.preventDefault();
			};
	});

		$('#new_user').click(function(event){
			if ($('#phone').val().charAt(0) === "1"){			
				$('#signup').children().first().text("Area code and number only. Please omit the 1.");
				event.preventDefault();
				restorePhoneDiv()
			}

		});

		function restorePhoneDiv(){
			setTimeout(
				function() {
					$('#signup').children().first().text("Sign Up for Free.");
				},
			4500);
		};

});