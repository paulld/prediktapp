predikt.controller 'adminCtrl', ($scope, $http, User, Bet, Message) ->
  $http.get(
    './api/matches/future?sort=starts_at'
  ).success (data) ->
    $scope.upcomingMatches = data.matches


  $http.get(
    './api/matches/past?sort=starts_at'
  ).success (data) ->
    $scope.pastMatches = data.matches
