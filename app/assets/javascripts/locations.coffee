# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  lat_field = $('#location_latitude')
  lng_field = $('#location_longitude')
  markersArray = []

  window.initMap = ->
    getLocation()
    if $('#map').size() > 0
      map = new google.maps.Map document.getElementById('map'), {
        center: {lat: 19.4357, lng: -99.1439}
        zoom: 8
      }
      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      map: map
    map.panTo latLng
    markersArray.push marker

  updateFields = (latLng) ->
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()

  getLocation = ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(showPosition)

  showPosition =  (position) ->
    alert position.coords.latitude + " long " + position.coords.longitude

    #
    #function getLocation() {
    #if (navigator.geolocation) {
     # navigator.geolocation.getCurrentPosition(showPosition);
    #  } else {
    #  x.innerHTML = "Geolocation is not supported by this browser.";
#  }
#}

  #function showPosition(position) {
    # x.innerHTML = "Latitude: " + position.coords.latitude +
#"<br>Longitude: " + position.coords.longitude;
#}