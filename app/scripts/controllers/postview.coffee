'use strict'

###*
 # @ngdoc function
 # @name angfbApp.controller:PostViewCtrl
 # @description
 # # PostViewCtrl
 # Controller of the angfbApp
###
app.controller 'PostViewCtrl', ($scope, $routeParams, Post) ->
  $scope.post = Post.get($routeParams.postId)
