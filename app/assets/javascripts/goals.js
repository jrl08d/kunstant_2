// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready( function() {	

	$( ":checkbox" ).unbind('click');
	$( ":checkbox" ).click( function() {
		var task = $(this).parent().parent();
		task.toggleClass('checked');
		});
		return false;
});  


