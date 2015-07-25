$(document).ready(function(){


	$('#phone-number, #pin-number').keypress(function(event){
			if(event.which != 8 && isNaN(String.fromCharCode(event.which)) || event.keycode == 32) {
				event.preventDefault();
			};
	});

		$('#continue').submit(function(event){
			var height = $('.lead').height();
			var width = $('.lead').width();
			if($('#phone-number').val().length < 10){
				freezePhoneDiv(event, height, width);

				$('.lead').text("Number must be ten digits.");
				restorePhoneDiv();
				
			} else if ($('#phone-number').val().charAt(0) === "1"){
				freezePhoneDiv(event, height, width);
				$('.lead').text("Area code and number only, please.");
				restorePhoneDiv();
			} else {
				$(this).unbind('submit');
			}

		});

})