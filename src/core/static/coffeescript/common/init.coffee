# Set up the top level namespace.  Need to do this
# before we create angular resources and such.
window.Disrupt = angular.module 'Disrupt', [
  'ngCookies',
  'ngResource',
  'ngAnimate',
  'ngRoute',
  'ivpusic.cookie',
  'ui.bootstrap',
  'angular-growl',
]

window.Disrupt.config ($httpProvider) ->
  if $('input[name=csrfmiddlewaretoken]')
    csrf_token = $('input[name=csrfmiddlewaretoken]')[0].value
    $httpProvider.defaults.headers.common['X-CSRFToken'] = csrf_token

window.Disrupt.run ($http, ipCookie)->
    if ipCookie('token')
        $http.defaults.headers.common.Authorization = 'Token ' + ipCookie('token')

window.Disrupt.run ($rootScope) ->
  $rootScope.$watchForValid = (watchExp, listener, objectEquality, deregisterNotifier) ->
    checkValid = (newValue, oldValue) ->
      listener() if newValue
    # this is the caller's scope
    this.$watch watchExp, checkValid, objectEquality, deregisterNotifier
