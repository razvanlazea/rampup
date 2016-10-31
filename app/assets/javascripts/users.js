var passwords_match = function(){
	if($(".js-password").val() == $(".js-confirm-password").val()){
		return true
	}
	return false
}

$(document).ready(function() {
	var ready = function(){
		$(".js-password").on("input", function(){
			if($(this).val().length < 6){
				if($(this).next().hasClass("notice")){
					$(this).next().remove();
				}
				$(this).after("<b style='color: red' class='notice'>Must have at least 6 characters</b>");	
			}
			if($(this).val().length >= 6 && $(this).next().hasClass("notice")){
				$(this).next().remove();
				$(this).after("<b style='color: green' class='notice'>Good</b>");

				if(passwords_match()){
					$(".js-confirm-password").next().remove();
					$(".js-confirm-password").after("<b style='color: green' class='notice'>Good</b>");
				}
			}
			if(!passwords_match() && $(".js-confirm-password").next().hasClass("notice")){
				$(".js-confirm-password").next().remove();
				$(".js-confirm-password").after("<b style='color: red' class='notice'>Passwords do not match</b>");

			}
		});
		$(".js-confirm-password").on("input", function(){
			if(!passwords_match()){
				if($(this).next().hasClass("notice")){
					$(this).next().remove();
				}
				$(this).after("<b style='color: red' class='notice'>Passwords do not match</b>");
			}
			if(passwords_match() && $(this).next().hasClass("notice")){
				$(this).next().remove();
				$(this).after("<b style='color: green' class='notice'>Good</b>");
			}
		});
		$("#new_user_form").submit(function(e){
			e.preventDefault();
			if(!passwords_match() || $(".js-password").val().length < 6){
				return false
			}
			else{
				return true
			}

		});
	};

	$(document).on('turbolinks:load', ready);
});