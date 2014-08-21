$( document ).ready( function () {
	$('.survey_form').validate({
		rules:{
			'survey[name]':
			{
				required: true,
				minlength: 2
			}
		},
		messages:{
			'survey[name]':
			{
				required: "Can't be blank",
				minlength: 'Min letters should be 2'
			}
		},
		highlight: function(element) {
			$(element).closest('.control-group').removeClass('success').addClass('error');
		},
		success: function(element) {
			element
			.text('OK!').addClass('valid')
			.closest('.control-group').removeClass('error').addClass('success');
		}
	});

});