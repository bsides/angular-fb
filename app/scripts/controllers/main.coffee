'use strict'

###*
 # @ngdoc function
 # @name angfbApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the angfbApp
###
angular.module('angfbApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
