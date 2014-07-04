predikt.config ["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when('/upcoming_games_list', {templateUrl: '/templates/matches/upcoming_games_list.html', controller: 'UpcomingCtrl'})
    .when('/completed_games_list', {templateUrl: '/templates/matches/completed_games_list.html', controller: 'CompletedGamesListCtrl'})
    .when('/leaderboard', {templateUrl: '/templates/leaderboard/leaderboard.html', controller: 'LeaderboardCtrl'})
    .when('/about', {templateUrl: '/templates/about.html', controller: 'AboutCtrl'})
    .when('/help', {templateUrl: '/templates/help.html', controller: 'HelpCtrl'})
    .when('/contact', {templateUrl: '/templates/contact.html', controller: 'ContactCtrl'})
    .when('/terms', {templateUrl: '/templates/terms.html'}, controller: 'TermsCtrl')
    .when('/privacy', {templateUrl: '/templates/privacy.html', controller: 'PrivacyCtrl'})
    .otherwise( {templateUrl: '/templates/index.html', controller: 'IndexCtrl'})
]
