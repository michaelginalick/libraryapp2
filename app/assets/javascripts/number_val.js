$(document).ready(function(){


	$('#phone-number, #pin-number').keypress(function(event){
			if(event.which != 8 && isNaN(String.fromCharCode(event.which)) || event.keycode == 32) {
				event.preventDefault();
			};
	});

		$('#continue').submit(function(event){
			if($('#phone-number').val().length < 10){
				$('.lead').text("Number must be ten digits.");
			} else if ($('#phone-number').val().charAt(0) === "1"){
				$('.lead').text("Area code and number only, please.");
			} else {
				$(this).unbind('submit');
			}

		});

})