predikt
  .config ($routeProvider) ->
    $routeProvider

      .when '/welcome',
        templateUrl: '/templates/welcome.html'
        controller: 'WelcomeCtrl'
      
      .when '/other',
        templateUrl: '/templates/other.html'
        controller: 'OtherCtrl'
      
      .otherwise
        templateUrl: '/templates/index.html'
        controller: 'IndexCtrl'   
