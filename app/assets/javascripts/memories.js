function initMap() {
  var city = document.getElementById('memory_city');

  var autocomplete = new google.maps.places.Autocomplete(city);

  var infowindow = new google.maps.InfoWindow();
  var infowindowContent = document.getElementById('infowindow-content');

  infowindow.setContent(infowindowContent);

  autocomplete.addListener('place_changed', function() {
    infowindow.close();

    var place = autocomplete.getPlace();

    if (!place.geometry) {
      return;
    }

    document.getElementById('memory_lat').value = place.geometry.location.lat();
    document.getElementById('memory_long').value = place.geometry.location.lng();
  });
}

// TODO - only do it when it's free

// function fetchWeatherAndTemperature(day, lat, long) {
//   var url = `https://api.openweathermap.org/data/2.5/history/city?lat=${lat}&lon=${long}&type=hour&start=${day}&end=${day}&appid=${3f311ddae225b418964aa7b3f45f1508}`

//   fetch(url)
//     .then(response => console.log(response.json()))
// }