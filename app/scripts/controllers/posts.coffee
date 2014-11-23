
###*
 # @ngdoc function
 # @name angfbApp.controller:PostsCtrl
 # @description
 # # PostsCtrl
 # Controller of the angfbApp
###
app.controller 'PostsCtrl', ($scope, Post) ->
  $scope.posts = Post.get()
  $scope.post =
    url: 'http://'
    title: ''

  $scope.submitPost = ->
    Post.save $scope.post, (ref) ->
      $scope.posts[ref.name] = $scope.post
      $scope.post =
        url: 'http://'
        title: ''
      return
    return

  $scope.deletePost = (postId) ->
    Post.delete(
      id: postId, ->
        delete $scope.posts[postId]
        return
    )
    return

  return
