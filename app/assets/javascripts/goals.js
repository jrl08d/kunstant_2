// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
         header: 
         {
         	left:   'title',
         	center: 'basicWeek',
         	right:  'today prev,next'
         }
    })

});