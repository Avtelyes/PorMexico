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
      icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
      map: map
    map.panTo latLng
    markersArray.push marker

  updateFields = (latLng) ->
    lat_field.val latLng.lat()
    lng_field.val latLng.lng()

  getAddress = () ->


  getLocation = ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(createMapNeed)

  showPosition =  (position) ->
    alert position.coords.latitude + " long " + position.coords.longitude

  createMarker = (location) ->
    new google.maps.Marker({
      position: location,
      label: "labels[i % labels.length]",
      #icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
    })

  createMapNeed = (position) ->
    if $('#mapN').size() > 0

      #Create map
      map = new google.maps.Map document.getElementById('mapN'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 5
      }

      #Load all locationsMarkers
      locations = [
        {lat: 19.4357, lng: -99.439},
        {lat: 19.43, lng: -99.39},
        {lat: 19.43, lng: -99.9},
        {lat: 19.57, lng: -99.9},
        {lat: 19.7, lng: -99.439},
        {lat: 19.7, lng: -99.2439},
        {lat: 19.57, lng: -99.639},
        {lat: 19.457, lng: -99.7439},
        {lat: 19.357, lng: -99.7439},
        {lat: 19.457, lng: -99.6439},
        {lat: 19.4357, lng: -99.5439},
        {lat: 19.42357, lng: -99.61439},
        {lat: 19.37, lng: -98.23},
        {lat: 19.2357, lng: -98.1439},
        {lat: 19.2357, lng: -100.1439},
        {lat: 19.7357, lng: -110.1439},
        {lat: 19.8357, lng: -98.1439},
        {lat: 19.9357, lng: -99.1439},
        {lat: 19.1357, lng: -96.1439},
        {lat: 19.2357, lng: -95.1439},
        {lat: 19.1357, lng: -94.1439},
        {lat: 19.1357, lng: -93.1439},
        {lat: 19.1357, lng: -91.1439}
      ]

      #Create markers array from locations array
      markers = (createMarker location for location in locations)

      options = {
        imagePath: '../images/m'
      }

      #Create mark cluster
      markerCluster = new MarkerClusterer(map, markers, options)

      #0 Necesita Ayuda
      #1 Ofrece ayuda

      #Add everything to the map

      #Add current location marker to map
      placeMarkerAndPanTo {lat: position.coords.latitude, lng: position.coords.longitude}, map

      #Listener to change current Position
      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng

    if $('#mapO').size() > 0
      #Create map
      map = new google.maps.Map document.getElementById('mapO'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 5
      }

      #Load all locationsMarkers
      locations = [
        {lat: 19.4357, lng: -99.439},
        {lat: 19.43, lng: -99.39},
        {lat: 19.43, lng: -99.9},
        {lat: 19.57, lng: -99.9},
        {lat: 19.7, lng: -99.439},
        {lat: 19.7, lng: -99.2439},
        {lat: 19.57, lng: -99.639},
        {lat: 19.457, lng: -99.7439},
        {lat: 19.357, lng: -99.7439},
        {lat: 19.457, lng: -99.6439},
        {lat: 19.4357, lng: -99.5439},
        {lat: 19.42357, lng: -99.61439},
        {lat: 19.37, lng: -98.23},
        {lat: 19.2357, lng: -98.1439},
        {lat: 19.2357, lng: -100.1439},
        {lat: 19.7357, lng: -110.1439},
        {lat: 19.8357, lng: -98.1439},
        {lat: 19.9357, lng: -99.1439},
        {lat: 19.1357, lng: -96.1439},
        {lat: 19.2357, lng: -95.1439},
        {lat: 19.1357, lng: -94.1439},
        {lat: 19.1357, lng: -93.1439},
        {lat: 19.1357, lng: -91.1439}
      ]

      #Create markers array from locations array
      markers = (createMarker location for location in locations)

      options = {
        imagePath: '../images/m'
      }

      #Create mark cluster
      markerCluster = new MarkerClusterer(map, markers, options)

      #0 Necesita Ayuda
      #1 Ofrece ayuda

      #Add everything to the map

      #Add current location marker to map
      placeMarkerAndPanTo {lat: position.coords.latitude, lng: position.coords.longitude}, map

      #Listener to change current Position
      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng


    if $('#mapPost').size() > 0

      #Create map
      map = new google.maps.Map document.getElementById('mapPost'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 15
      }

      #Add current location marker to map
      placeMarkerAndPanTo {lat: position.coords.latitude, lng: position.coords.longitude}, map

      #Listener to change current Position
      map.addListener 'click', (e) ->
        placeMarkerAndPanTo e.latLng, map
        updateFields e.latLng



      #Load external info
      #externalKML = "../QueExterno.kml"
      #kmlLayer = new google.maps.KmlLayer({
      #  url: 'http://107.170.204.115/ExternalCDMX.kml'
      #  preserveViewport: true,
      #  map: map
      #})