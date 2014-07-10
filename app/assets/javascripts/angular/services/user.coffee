predikt.factory 'User', ($http, Message) ->
  User = 

    getUser: () ->
      $http.get('./api/profile/' ).success (userData) ->
        userData

    currentUserId: ->
      $http.get('./api/profile/' ).success (userData) ->
        userData.users[0].id

    follow: (followerId, followeeId) ->
      $http.get('./api/uuids').success (uuid) ->
        newUuid = uuid.uuids[0]
        
        followUrl = "./api/followings/#{newUuid}"

        followData = {
          follower_id: followerId
          followee_id: followeeId
          # links: {
          #   user: {
          #     id: profileId
          #   }
          #   match: {
          #     id: matchId
          #   }
          # }
        }


        console.log 'data', followData
        console.log 'url', followUrl

        $http(
          method: "PUT"
          url: followUrl
          data: followData
        )
        Message.noty('Now following', 'success', 500)
