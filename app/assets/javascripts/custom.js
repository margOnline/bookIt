$(document).ready(function() {

    // page is now ready, initialize the calendar...

    var current_resource = function(){
    	return window.location.href.match(/resources\/(\d+)\/booking/)[1];
    };

    $('#calendar').fullCalendar({
        header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},

			eventSources: [{  
    		url: '/resources/'+current_resource()+'/bookings/',  
   		}]

			// events: [
		 //        {
		 //            title: 'Court booking',
		 //            start: '2013-10-10'
		 //        },
		 //        {
		 //            title: 'Event2',
		 //            start: '2013-10-10'
		 //        }
		 //        // etc...
		 //    ]
		    // ,
 

			// dayClick: function(date, allDay, jsEvent, view) {

   //      if (allDay) {
   //          alert('Clicked on the entire day: ' + date);
   //      }else{
   //          alert('Clicked on the slot: ' + date);
   //      }

   //      alert('Current view: ' + view.name);

   //      // change the day's background color just for fun
   //      $(this).css('background-color', 'red');

   //  	} 
 });

});
