predikt.factory 'User', ($http, Message) ->
  User = 

    getUser: (userId) ->
      $http.get('./api/users/' + userId).success (userData) ->
        userData

    getCurrentUser: () ->
      $http.get('./api/profile/' ).success (userData) ->
        userData

    getUserBets: (userId) ->
      $http.get('./api/users/' + userId + '/bets').success (betData) ->
        betData

    createFollow: (followerId, followeeId, followeeUserame) ->
      $http.get('./api/uuids').success (uuid) ->
        newUuid = uuid.uuids[0]
        
        followData = {
          follower_id: followerId
          followee_id: followeeId
        }

        $http(
          method: "PUT"
          url: './api/followings/' + newUuid
          data: followData
        ).success (followData) ->
          if followData.followings[0].followee_id is followeeId && followData.followings[0].follower_id is followerId
            Message.noty("Your are now following #{followeeUserame}", 'success', 500)

    update: (userId, formData) ->
      updateData = {
        user_name: formData.user_name.$modelValue
        first_name: formData.first_name.$modelValue
        last_name: formData.last_name.$modelValue
        description: formData.description.$modelValue
        website: formData.website.$modelValue
        home_town: formData.home_town.$modelValue
      }
      $http(
        method: "PATCH"
        url: './api/users/' + userId
        data: updateData
      ).success () ->
        Message.noty('You profile was successfully updated.', 'success', 500)
      .error () ->
        Message.noty("Your profile cannot be updated! <br>Your Username can't be blank", 'error', 1500)

