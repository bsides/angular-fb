'use strict'

app.factory 'Auth', ($firebaseAuth, FIREBASE_URL, $rootScope) ->
  ref = new Firebase(FIREBASE_URL)
  auth = $firebaseAuth ref

  Auth =
    register: (user) ->
      auth.$createUser user.email, user.password
    login: (user) ->
      auth.$authWithPassword
        email: user.email
        password: user.password
    logout: ->
      auth.$unauth()
      return
    resolveUser: ->
      authData = auth.$getAuth()
    signedIn: ->
      authData = auth.$getAuth()
      if authData then true else false
    user: {}

  $rootScope.$on '$firebaseAuth:onAuth', (e, user) ->
    console.log 'logged in'
    angular.copy user, Auth.user
    return

  $rootScope.$on '$firebaseAuth:logout', ->
    console.log 'logged out'
    angular.copy {}, Auth.user

  Auth
