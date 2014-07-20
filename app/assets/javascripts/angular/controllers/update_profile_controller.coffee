predikt.controller 'updateProfileCtrl', ($scope, $http, $location, $routeParams, User, Message) ->
  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

  $scope.viewProfile = () ->
    $location.url '/my-profile'

  $scope.submit = (formData) ->
    # $scope.submitted = true
    User.update($scope.profile.id, formData)
      .success (response) ->
        $location.url '/my-profile'
        Message.noty('You profile was successfully updated.', 'success', 500)
      .error (response) ->
        Message.noty("Your profile cannot be updated! <br>Your Username can't be blank", 'error', 1500)
