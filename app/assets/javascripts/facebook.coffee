#jQuery ->
#  $('body').prepend('<div id="fb-root"></div>')
#
#  $.ajax
#    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
#    dataType: 'script'
#    cache: true
#
#
#window.fbAsyncInit = ->
#
#  FB.init(appId: '768254370020920',
#    cookie: true,
#    xfbml: true)
#
##  FB.AppEvents.logPageView();
#
#  $('#sign_in').click (e) ->
#    e.preventDefault()
#    FB.login (response) ->
#      console.log (response)
#      window.location = '/auth/facebook/callback?'+ $.param({ code: response.authResponse.signedRequest }) if response.authResponse
#
#  $('#sign_out').click (e) ->
#    FB.getLoginStatus (response) ->
#      FB.logout() if response.authResponse
#    true