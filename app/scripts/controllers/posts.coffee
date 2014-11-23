'use strict'

###*
 # @ngdoc function
 # @name angfbApp.controller:PostsCtrl
 # @description
 # # PostsCtrl
 # Controller of the angfbApp
###
app.controller 'PostsCtrl', ($scope, Post) ->
  $scope.helpers = app.helpers
  $scope.invisible = false
  $scope.posts = Post.all
  $scope.post =
    url: 'http://',
    title: ''

  $scope.deletePost = (post) ->
    Post.delete post

  $scope.printedPosts = $scope.helpers.output

  $scope.toggle = ->
    $scope.invisible = not $scope.invisible

  return
