prediktApp.config ["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when('/', {templateUrl: '/templates/welcome.html', controller: 'welcomeController'})
    .when('/other', {templateUrl: '/templates/other.html', controller: 'otherController'})
]