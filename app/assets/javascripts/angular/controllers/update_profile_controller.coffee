predikt.controller 'updateProfileCtrl', ($scope, $http, $location, $routeParams, User, Message) ->
  $scope.profile = null
  User.getCurrentUser().then (result) ->
    $scope.profile = result.data.users[0]

  $scope.viewProfile = () ->
    $location.url '/my-profile'

  $scope.submit = (formData) ->
    # $scope.submitted = true
    User.update($scope.profile.id, formData).success () ->
      $location.url '/my-profile'
      