// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.





$(document).ready(function() {
	$( ":checkbox" ).unbind('click');
	$( ":checkbox" ).click( function() {
		var task = $(this).parent().parent();
		task.toggleClass('checked');
	});
	return false;
});  

var image_array = [
    "#fff585",
    "#058454",
    "#032564",
    "/assets/Watercolors-Morning-Mist-Temple-Waterfalls-1440x2560.jpg"
];
