###* global app:true ###
###* exported app ###

'use strict'

###*
 # @ngdoc overview
 # @name angfbApp
 # @description
 # # angfbApp
 #
 # Main module of the application.
###

root = exports ? this

root.app = angular
  .module('angfbApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
    'firebase'
  ])
  .constant 'FIREBASE_URL', 'https://angularfb.firebaseio.com/'
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/posts.html'
        controller: 'PostsCtrl'
      .when '/register',
        templateUrl: 'views/register.html'
        controller: 'AuthCtrl'
        resolve:
          user: (Auth) ->
            Auth.signedIn()
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'AuthCtrl'
        resolve:
          user: (Auth) ->
            Auth.signedIn()
      .otherwise
        redirectTo: '/'
    return

###*
 # @ngdoc object
 # @name angfbApp.app:helpers
 # @description
 # # helpers
 # Helpers of the angfbApp
###
root.app.helpers =
  ###*
   # @ngdoc function
   # @name angfbApp.app.helpers:output
   # @description
   # # helpers
   # Helpers of the angfbApp
  ###
  output: (json, withSyntaxHighlight = true) ->
    if withSyntaxHighlight?
      json = JSON.stringify(json, 'undefined', 2)
    else
      return JSON.stringify(json, 'undefined', 2)

    json = json.replace(/&/g, '&').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    result = json.replace /("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, (match) ->
      cls = 'number'
      if /^"/.test(match)
        if /:$/.test(match)
          cls = 'key'
        else
          cls = 'string'
      else if /true|false/.test(match)
        cls = 'boolean'
      else cls = 'null'  if /null/.test(match)
      '<span class="' + cls + '">' + match + '</span>'

    result

