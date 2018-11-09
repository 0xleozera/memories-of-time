
function initMap() {
  const input = document.getElementById('memory_city');
  // const lat = document.getElementById('memory_lat').value;
  // const lng = document.getElementById('memory_long').value;

  const autocomplete = new google.maps.places.Autocomplete(input);

  const infowindow = new google.maps.InfoWindow();
  const infowindowContent = document.getElementById('infowindow-content');

  infowindow.setContent(infowindowContent);

  autocomplete.addListener('place_changed', () => {
    infowindow.close();

    const place = autocomplete.getPlace();
    //console.log(place.geometry.location.lat());

    if (!place.geometry) {
      return;
    }
  });
}