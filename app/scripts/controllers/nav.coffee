'use strict'

app.controller 'NavCtrl', ($scope, $location, Auth, Post) ->
  $scope.signedIn = Auth.signedIn
  $scope.logout = Auth.logout
  $scope.post =
    url: 'http://'
    title: ''

  $scope.submitPost = ->
    Post.create $scope.post
      .then (ref) ->
        $location.path '/posts/' + ref.name()
        $scope.post =
          url: 'http://'
          title: ''
        return

  return
