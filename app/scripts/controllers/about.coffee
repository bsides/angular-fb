'use strict'

###*
 # @ngdoc function
 # @name angfbApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the angfbApp
###
angular.module('angfbApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
