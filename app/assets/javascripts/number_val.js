$(document).ready(function(){


	$('#phone').keypress(function(event){
			if(event.which != 8 && isNaN(String.fromCharCode(event.which)) || event.keycode == 32) {
				event.preventDefault();
			};
	});

		$('#new_user').onclick(function(event){
			if($('#phone').val().length < 10){
				$('.lead').text("Number must be ten digits.");
				event.preventDefault();
			} else if ($('#phone-number').val().charAt(0) === "1"){
				$('.lead').text("Area code and number only, please.");
				event.preventDefault();
			} else {
				$(this).unbind('submit');
			}

		});

})