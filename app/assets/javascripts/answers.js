$( document ).ready( function () {
	$('#new_answer').validate({
		highlight: function(element) {
			$(element).closest('.control-group').removeClass('success').addClass('error');
		},
		success: function(element) {
			element
			.addClass('valid')
			.closest('.control-group').removeClass('error').addClass('success');
		}
	});

	$( ".required" ).each(function(){
		$(this).rules( "add", {
			required: true,
			messages: {
				required: "Can't be blank"
			}
		});
	});

	$( ".survey_number" ).each(function(){
		$(this).rules( "add", {
			number: true,
			messages: {
				number: "Should be number"
			}
		});
	});

	$( ".survey_date" ).each(function(){
		$(this).rules( "add", {
			date: true,
			messages: {
				date: "Should be date"
			}
		});
	});

	$('.survey_date').datepicker()

});