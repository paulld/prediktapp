predikt.config ["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when '/upcoming_matches_list',
      templateUrl: '/templates/matches/upcoming_matches_list.html'

    .when '/completed_matches_list',
      templateUrl: '/templates/matches/completed_matches_list.html'

    .when '/leaderboard',
      templateUrl: '/templates/leaderboard/leaderboard.html'
      controller: 'LeaderboardCtrl'

    .when '/about',
      templateUrl: '/templates/about.html'
      controller: 'AboutCtrl'

    .when '/help',
      templateUrl: '/templates/help.html'
      controller: 'HelpCtrl'

    .when '/contact',
      templateUrl: '/templates/contact.html'
      controller: 'ContactCtrl'

    .when '/terms',
      templateUrl: '/templates/terms.html'
      controller: 'TermsCtrl'

    .when '/privacy',
      templateUrl: '/templates/privacy.html'
      controller: 'PrivacyCtrl'

    .otherwise
      templateUrl: '/templates/index.html'
      controller: 'IndexCtrl'
]