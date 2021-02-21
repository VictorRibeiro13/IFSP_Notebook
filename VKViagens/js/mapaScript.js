
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACxX8FA89wrWGJ0d29te-i7r-FhfOXNw4&callback=initMap">
    </script>


function mapSet(lat, lng){

    var uluru = {lat: 48.1049441, lng: 4.1858258};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      center: uluru
    });
    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }

 var Oceania = {lat: -25.363, lng: 131.044};
 var AMS = {lat: -15.6249004, lng: -100.4798618}; // -15.6249004,-100.4798618,3
 var Oceania = {lat: -25.363, lng: 131.044};
 var Oceania = {lat: -25.363, lng: 131.044};
 var Oceania = {lat: -25.363, lng: 131.044};

// slide 

$(function()
{
     $("div#toggle").click(function()
     {
         $("togleslide1").slideToggle();
         return false;
     }); 
});

