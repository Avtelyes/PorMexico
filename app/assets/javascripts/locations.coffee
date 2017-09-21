# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  lat_field = $('#location_latitude')
  lng_field = $('#location_longitude')
  markersArray = []

  window.initMap = ->
    getLocation()

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
      navigator.geolocation.getCurrentPosition(createMap)

  showPosition =  (position) ->
    alert position.coords.latitude + " long " + position.coords.longitude

  createMap = (position) ->
    if $('#map').size() > 0
      map = new google.maps.Map document.getElementById('map'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 15
      }
      markerCurrentLocation = new google.maps.Marker({
        position: {lat: position.coords.latitude, lng: position.coords.longitude},
        title: "Ubicación actual"
      })
      markerCurrentLocation.setMap(map)
      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng

      #Load external info
      externalKML = "ExternalCDMX.kml"
      kmlLayer = new google.maps.KmlLayer(externalKML,{
        #suppressInfoWindows: true,
        preserveViewport: true,
        map: map
      })
      #var kmlLayer = new google.maps.KmlLayer(src, {
       # suppressInfoWindows: true,
        #preserveViewport: false,
       # map: map
      #});
       # var marker = new google.maps.Marker({
        #  position: myLatlng,
         # title:"Hello World!"
        #});

#// To add the marker to the map, call setMap();
#marker.setMap(map);