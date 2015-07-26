$(document).ready(function(){

	$('#phone').keypress(function(event){
			if(event.which != 8 && isNaN(String.fromCharCode(event.which)) || event.keycode == 32) {
				event.preventDefault();
			};
	});

		$('#new_user').click(function(event){
			if ($('#phone').val().charAt(0) === "1"){			
				$('#signup').children().first().text("Area code and number only, please.");

			}

		});

		window.onbeforeunload = function() {
    	window.localStorage.setItem(name, $('#username').val() );
    	window.localStorage.setItem(email, $('#email').val() ); 
		}

		window.onload = function() {
    	var name = window.localStorage.getItem(name);
    	var email = window.localStorage.getItem(email);
    	if (name !== null) 
    		$('#username').val(name);
    	if (email !== null) 
    		$('#email').val(email);
		}
});