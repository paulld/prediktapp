predikt.config ["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when('/', {templateUrl: '/templates/welcome.html', controller: 'WelcomeCtrl'})
    .when('/other', {templateUrl: '/templates/other.html', controller: 'OtherCtrl'})
]