'use strict'

app.factory 'Post', ($resource) ->
  $resource('https://angularfb.firebaseio.com/posts/:id.json')

