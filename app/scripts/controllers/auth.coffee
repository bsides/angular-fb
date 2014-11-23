'use strict'

app.controller 'AuthCtrl', ($scope, $location, Auth, user) ->
  $location.path '/' if user

  $scope.register = ->
    Auth.register $scope.user
      .then ->
        Auth.login $scope.user
          .then ->
            $location.path '/'
            return
          , (error) ->
            $scope.error = error.toString()
    return

  $scope.login = ->
    Auth.login $scope.user
      .then ->
        $location.path '/'
        , (error) ->
          $scope.error = error.toString()

  return
