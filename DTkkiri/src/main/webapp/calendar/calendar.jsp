<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='../css/fullcalendar.css' rel='stylesheet' />
    <script src='../js/fullcalendar.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          googleCalendarApiKey: 'AIzaSyDW61cUpMje4uJLv927INfTjoPGibfZLek',
          events: {
            googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
            className: 'gcal-event' // an option!
          },
          eventClick : function(info){
        	  info.jsEvent.stopPropagation();
        	  info.jsEvent.preventDefault();
          },
        });
        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

