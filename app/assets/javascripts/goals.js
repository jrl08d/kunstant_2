// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        editable: true,
        weekMode: 'liquid',
        defaultView: 'basicWeek',
        height: 350,
         header: 
         {
         	left:   'title',
         	right:  'today prev,next'
         }

    })

});