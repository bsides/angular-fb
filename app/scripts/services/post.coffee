'use strict'

app.factory 'Post', ($firebase, FIREBASE_URL) ->
  ref = new Firebase(FIREBASE_URL)
  posts = $firebase ref.child 'posts'
    .$asArray()

  Post =
    all: posts
    create: (post) ->
      posts.$add post
    get: (postId) ->
      $firebase (
        ref.child 'posts'
        .child postId
        )
        .$asObject();
    delete: (post) ->
      posts.$remove post

