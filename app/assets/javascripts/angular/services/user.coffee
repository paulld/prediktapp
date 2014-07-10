predikt.factory 'User', ($http) ->
  User = 

    getUser: () ->
      $http.get('./api/profile/' ).success (userData) ->
        userData

    currentUserId: ->
      $http.get('./api/profile/' ).success (userData) ->
        userData.users[0].id
