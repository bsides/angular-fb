
###*
 # @ngdoc function
 # @name angfbApp.controller:PostsCtrl
 # @description
 # # PostsCtrl
 # Controller of the angfbApp
###
app.controller 'PostsCtrl', ($scope) ->
  $scope.posts = []
  $scope.post =
    url: 'http://'
    title: ''

  $scope.submitPost = ->
    $scope.posts.push($scope.post)
    $scope.post =
      url: 'http://'
      title: ''
    return

  $scope.deletePost = (index) ->
    $scope.posts.splice(index, 1)
    return

  return
