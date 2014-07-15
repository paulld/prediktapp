predikt.factory 'User', ($http, Message) ->
  User = 

    getCurrentUser: () ->
      $http.get('./api/profile/' ).success (userData) ->
        userData

    # currentUserId: ->
    #   $http.get('./api/profile/' ).success (userData) ->
    #     userData.users[0].id

    createFollow: (followerId, followeeId, followeeUserame) ->
      $http.get('./api/uuids').success (uuid) ->
        newUuid = uuid.uuids[0]
        
        followUrl = "./api/followings/#{newUuid}"

        followData = {
          follower_id: followerId
          followee_id: followeeId
        }

        $http(
          method: "PUT"
          url: followUrl
          data: followData
        ).success (followData) ->
          if followData.followings[0].followee_id is followeeId && followData.followings[0].follower_id is followerId
            Message.noty("Your are now following #{followeeUserame}", 'success', 500)
