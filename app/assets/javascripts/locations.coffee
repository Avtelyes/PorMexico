# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  lat_field = $('#post_location_attributes_latitude')
  lng_field = $('#post_location_attributes_longitude')
  markersArray = []

  window.initMap = ->
    getLocation()

  placeMarkerAndPanTo = (latLng, map) ->
    markersArray.pop().setMap(null) while(markersArray.length)
    marker = new google.maps.Marker
      position: latLng
      icon: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png'
      map: map
    map.panTo latLng
    markersArray.push marker

  updateFields = (latLng) ->
    lat_field.val latLng.lat
    lng_field.val latLng.lng

  getAddress = () ->


  getLocation = ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition(createMapNeed)

  showPosition =  (position) ->
    alert position.coords.latitude + " long " + position.coords.longitude

  createMarker = (location) ->
    if location.status == "active"
      new google.maps.Marker({
        position: location,
        #label: "labels[i % labels.length]",
        #icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
      })

  createMapNeed = (position) ->
    if $('#mapN').size() > 0

      #Create map
      map = new google.maps.Map document.getElementById('mapN'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 5
      }

      locations = JSON.parse($('#need_locations_list').children('input').attr("name").slice(18, $('#need_locations_list').children('input').attr("name").length-2).replace(/:/g, "").replace(/=>/g,":").replace(/lat/g, '"lat"').replace(/lng/g, '"lng"').replace(/status/g, '"status"'))

      #Load all locationsMarkers

      #Create markers array from locations array
      markers = (createMarker location for location in locations)

      options = {
        imagePath: '../images/m'
      }

      #Create mark cluster
      markerCluster = new MarkerClusterer(map, markers, options)

      #0 Necesita Ayuda
      #1 Ofrece ayuda

    if $('#mapO').size() > 0
      #Create map
      map = new google.maps.Map document.getElementById('mapO'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 5
      }

      #Load all locationsMarkers
      locations = JSON.parse($('#offer_locations_list').children('input').attr("name").slice(18, $('#offer_locations_list').children('input').attr("name").length-2).replace(/:/g, "").replace(/=>/g,":").replace(/lat/g, '"lat"').replace(/lng/g, '"lng"').replace(/status/g, '"status"'))

      #Create markers array from locations array
      markers = (createMarker location for location in locations)

      options = {
        imagePath: '../images/m'
      }

      #Create mark cluster
      markerCluster = new MarkerClusterer(map, markers, options)

    if $('#mapPost').size() > 0

      #Create map
      map = new google.maps.Map document.getElementById('mapPost'), {
        center: {lat: position.coords.latitude, lng: position.coords.longitude}
        zoom: 15
      }

      #Add current location marker to map
      placeMarkerAndPanTo {lat: position.coords.latitude, lng: position.coords.longitude}, map

      #Update form values
      updateFields {lat: position.coords.latitude, lng: position.coords.longitude}

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