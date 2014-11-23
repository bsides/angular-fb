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
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/posts.html'
        controller: 'PostsCtrl'
      .otherwise
        redirectTo: '/'

