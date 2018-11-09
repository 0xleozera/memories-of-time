function initMap() {
  const city = document.getElementById('memory_city');

  const autocomplete = new google.maps.places.Autocomplete(city);

  const infowindow = new google.maps.InfoWindow();
  const infowindowContent = document.getElementById('infowindow-content');

  infowindow.setContent(infowindowContent);

  autocomplete.addListener('place_changed', () => {
    infowindow.close();

    const place = autocomplete.getPlace();

    if (!place.geometry) {
      return;
    }

    document.getElementById('memory_lat').value = place.geometry.location.lat();
    document.getElementById('memory_long').value = place.geometry.location.lng();
  });
}

// TODO - only do it when it's free

// function fetchWeatherAndTemperature(day, lat, long) {
//   const url = `https://api.openweathermap.org/data/2.5/history/city?lat=${lat}&lon=${long}&type=hour&start=${day}&end=${day}&appid=${3f311ddae225b418964aa7b3f45f1508}`

//   fetch(url)
//     .then(response => console.log(response.json()))
// }