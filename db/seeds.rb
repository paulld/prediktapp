User.destroy_all
Registrant.destroy_all
Match.destroy_all
League.destroy_all
Following.destroy_all
ProfileComment.destroy_all
MatchComment.destroy_all
Bet.destroy_all
Sport.destroy_all

registrants = Registrant.create([
  {
    email: "roger@predikt.com"
  },
  {
    email: "myriam@predikt.com"
  }
])

users = User.create([
  {
    user_name: "Bob",
    email: "bob@predikt.com",
    coins: 1000
  },
  {
    user_name: "Stan",
    email: "stan@predikt.com",
    coins: 1000
  },
  {
    user_name: "Phil",
    email: "phil@predikt.com",
    coins: 1000
  },
  {
    user_name: "Jimmer",
    email: "jimjim@predikt.com",
    coins: 1000
  },
  {
    user_name: "Tim",
    email: "timmy@predikt.com",
    coins: 1000
  },
  {
    user_name: "Kenny",
    email: "kenny@predikt.com",
    coins: 1000
  },
  {
    user_name: "Vlad",
    email: "vladimir@predikt.com",
    coins: 1000
  },
  {
    user_name: "Kate",
    email: "missk@predikt.com",
    coins: 1000
  },
  {
    user_name: "Cartman",
    email: "cartman@predikt.com",
    coins: 1000
  },
  {
    user_name: "Floyd",
    email: "floyd@predikt.com",
    coins: 1000
  },
  {
    user_name: "Kyle",
    email: "kyle@predikt.com",
    coins: 1000
  }
])

coin_transaction = CoinTransaction.create([
  {
    user: users[0],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[1],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[2],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[3],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[4],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[5],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[6],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[7],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[8],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[9],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
  {
    user: users[10],
    before_value: 0,
    after_value: 1000,
    transaction_type: "init"
  },
])


sports = Sport.create([
  { 
    name: "Football"
  },
  { 
    name: "US Football"
  },
  { 
    name: "Basketball"
  }
])

leagues = League.create([
  { 
    name: "World Cup 2014",
    sport: sports[0]
  },
  { 
    name: "Major Soccer League 2014-2015",
    sport: sports[0]
  },
  { 
    name: "Premier league 2014-2015",
    sport: sports[0]
  },
  { 
    name: "Liga 2014-2015",
    sport: sports[0]
  }
])

matches = Match.create([
  {
    league: leagues[2],
    home_team: "San Jose Quakes",
    away_team: "Chicago Fire",
    home_team_iso_code: "sanjose",
    away_team_iso_code: "chivas",
    starts_at: "2014-07-24 10:30:00 +0800",
    ends_at: "2014-07-24 12:30:00 +0800",
    home_odds: 2.16,
    draw_odds: 3.26,
    away_odds: 3.29,
    over_under_value: 2.5,
    over_odds: 2.8,
    under_odds: 1.9,
    handicap_value: 2.5,
    handicap_side: 'home',
    home_handicap_odds: 1.83,
    away_handicap_odds: 2.52,
    match_status: "completed",
    home_score: 5,
    away_score: 1,
    home_draw_away_result: "home",
    over_under_result: "over",
    handicap_result: "home_handicap"
  },
  {
    league: leagues[2],
    home_team: "Real Salt Lake",
    away_team: "Montreal Impact",
    home_team_iso_code: "saltlake",
    away_team_iso_code: "montreal",
    starts_at: "2014-07-25 10:00:00 +0800",
    ends_at: "2014-07-25 12:00:00 +0800",
    home_odds: 1.67,
    draw_odds: 3.68,
    away_odds: 4.89,
    over_under_value: 1.5,
    over_odds: 1.77,
    under_odds: 1.38,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 1.11,
    away_handicap_odds: 4.94,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Colorado Rapids",
    away_team: "Chivas USA",
    home_team_iso_code: "coloradorapids",
    away_team_iso_code: "chivas",
    starts_at: "2014-07-26 9:30:00 +0800",
    ends_at: "2014-07-26 11:30:00 +0800",
    home_odds: 1.72,
    draw_odds: 3.55,
    away_odds: 4.62,
    over_under_value: 3.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 1.5,
    handicap_side: 'away',
    home_handicap_odds: 1.92,
    away_handicap_odds: 2.33,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Toronto FC",
    away_team: "Sporting KC",
    home_team_iso_code: "toronto",
    away_team_iso_code: "sportingkc",
    starts_at: "2014-07-27 7:00:00 +0800",
    ends_at: "2014-07-27 9:00:00 +0800",
    home_odds: 2.59,
    draw_odds: 3.55,
    away_odds: 2.66,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 1.83,
    away_handicap_odds: 1.9,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "NE Revolution",
    away_team: "Columbus Crew",
    home_team_iso_code: "nerevolution",
    away_team_iso_code: "columbus",
    starts_at: "2014-07-27 7:30:00 +0800",
    ends_at: "2014-07-27 9:30:00 +0800",
    home_odds: 1.85,
    draw_odds: 3.25,
    away_odds: 4.65,
    over_under_value: 1.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 2.5,
    handicap_side: 'away',
    home_handicap_odds: 1.85,
    away_handicap_odds: 1.85,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Vancouver Caps",
    away_team: "FC Dallas",
    home_team_iso_code: "vancouver",
    away_team_iso_code: "dallas",
    starts_at: "2014-07-28 5:00:00 +0800",
    ends_at: "2014-07-28 7:00:00 +0800",
    home_odds: 2.05,
    draw_odds: 3.33,
    away_odds: 3.37,
    over_under_value: 1.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 2.5,
    handicap_side: 'home',
    home_handicap_odds: 1.89,
    away_handicap_odds: 1.96,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Montreal Impact",
    away_team: "Portland Timbers",
    home_team_iso_code: "montreal",
    away_team_iso_code: "portland",
    starts_at: "2014-07-28 8:00:00 +0800",
    ends_at: "2014-07-28 10:00:00 +0800",
    home_odds: 2.05,
    draw_odds: 3.33,
    away_odds: 2.90,
    over_under_value: 1.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 1.5,
    handicap_side: 'away',
    home_handicap_odds: 1.76,
    away_handicap_odds: 2.33,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Seattle Sounders",
    away_team: "LA Galaxy",
    home_team_iso_code: "seattle",
    away_team_iso_code: "lagalaxy",
    starts_at: "2014-07-28 10:00:00 +0800",
    ends_at: "2014-07-28 12:00:00 +0800",
    home_odds: 2.40,
    draw_odds: 3.25,
    away_odds: 3.33,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 3.5,
    handicap_side: 'away',
    home_handicap_odds: 1.97,
    away_handicap_odds: 2.42,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "D.C. United",
    away_team: "Toronto FC",
    home_team_iso_code: "dcunited",
    away_team_iso_code: "toronto",
    starts_at: "2014-07-30 7:00:00 +0800",
    ends_at: "2014-07-30 9:00:00 +0800",
    home_odds: 1.32,
    draw_odds: 5.32,
    away_odds: 6.11,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 3.83,
    away_handicap_odds: 1.52,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Manchester United",
    away_team: "Swansea City",
    home_team_iso_code: "manunited",
    away_team_iso_code: "swanseacity",
    starts_at: "2014-08-16 12:45:00 +0100",
    ends_at: "2014-08-16 14:45:00 +0100",
    home_odds: 1.37,
    draw_odds: 4.8,
    away_odds: 9.0,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 1.83,
    away_handicap_odds: 5.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Leicester City",
    away_team: "Everton FC",
    home_team_iso_code: "leicester",
    away_team_iso_code: "everton",
    starts_at: "2014-08-16 15:00:00 +0100",
    ends_at: "2014-08-16 17:00:00 +0100",
    home_odds: 3.1,
    draw_odds: 3.4,
    away_odds: 2.25,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 1.5,
    handicap_side: 'away',
    home_handicap_odds: 2.93,
    away_handicap_odds: 3.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Queens Park Rangers",
    away_team: "Hull City",
    home_team_iso_code: "qpr",
    away_team_iso_code: "hullcity",
    starts_at: "2014-08-16 15:00:00 +0100",
    ends_at: "2014-08-16 17:00:00 +0100",
    home_odds: 2.5,
    draw_odds: 3.4,
    away_odds: 2.8,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.7,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 2.83,
    away_handicap_odds: 1.62,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Stoke City",
    away_team: "Aston Villa",
    home_team_iso_code: "stokecity",
    away_team_iso_code: "astonvilla",
    starts_at: "2014-08-16 15:00:00 +0100",
    ends_at: "2014-08-16 17:00:00 +0100",
    home_odds: 2.1,
    draw_odds: 3.3,
    away_odds: 3.7,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 2.83,
    away_handicap_odds: 2.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "West Bronwich Albion",
    away_team: "Sunderland",
    home_team_iso_code: "westbrown",
    away_team_iso_code: "sunderland",
    starts_at: "2014-08-16 15:00:00 +0100",
    ends_at: "2014-08-16 17:00:00 +0100",
    home_odds: 1.37,
    draw_odds: 2.3,
    away_odds: 3.4,
    over_under_value: 3.1,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 2.13,
    away_handicap_odds: 2.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "West Ham United",
    away_team: "Tottenham Hotspur",
    home_team_iso_code: "westham",
    away_team_iso_code: "tottenham",
    starts_at: "2014-08-16 15:00:00 +0100",
    ends_at: "2014-08-16 17:00:00 +0100",
    home_odds: 3.3,
    draw_odds: 3.4,
    away_odds: 2.2,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 1.5,
    handicap_side: 'away',
    home_handicap_odds: 2.83,
    away_handicap_odds: 3.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Arsenal",
    away_team: "Crystal Palace",
    home_team_iso_code: "arsenal",
    away_team_iso_code: "crystalpalace",
    starts_at: "2014-08-16 17:30:00 +0100",
    ends_at: "2014-08-16 19:30:00 +0100",
    home_odds: 1.3,
    draw_odds: 5.5,
    away_odds: 10.0,
    over_under_value: 2.5,
    over_odds: 1.5,
    under_odds: 1.8,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 1.73,
    away_handicap_odds: 2.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Liverpool FC",
    away_team: "Southampton FC",
    home_team_iso_code: "liverpool",
    away_team_iso_code: "southampton",
    starts_at: "2014-08-17 13:30:00 +0100",
    ends_at: "2014-08-17 15:30:00 +0100",
    home_odds: 1.4,
    draw_odds: 4.5,
    away_odds: 8.5,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 1.5,
    handicap_side: 'home',
    home_handicap_odds: 1.73,
    away_handicap_odds: 2.81,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Newcastle United",
    away_team: "Manchester City",
    home_team_iso_code: "newcastle",
    away_team_iso_code: "mancity",
    starts_at: "2014-08-17 16:00:00 +0100",
    ends_at: "2014-08-17 18:00:00 +0100",
    home_odds: 5.5,
    draw_odds: 3.8,
    away_odds: 1.65,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 2.5,
    handicap_side: 'away',
    home_handicap_odds: 2.83,
    away_handicap_odds: 2.92,
    match_status: "pending"
  },
  {
    league: leagues[3],
    home_team: "Burnley FC",
    away_team: "Chelsea FC",
    home_team_iso_code: "burnley",
    away_team_iso_code: "chelsea",
    starts_at: "2014-08-18 20:00:00 +0100",
    ends_at: "2014-08-18 22:00:00 +0100",
    home_odds: 8.0,
    draw_odds: 4.7,
    away_odds: 1.4,
    over_under_value: 2.5,
    over_odds: 1.6,
    under_odds: 1.5,
    handicap_value: 2.5,
    handicap_side: 'away',
    home_handicap_odds: 2.83,
    away_handicap_odds: 1.92,
    match_status: "pending"
  }
])

match_comments = MatchComment.create([
  {
    content: "A comment on the first match",
    user: users[1],
    match: matches[0]
  },
  {
    content: "A comment on the second match",
    user: users[0],
    match: matches[1]
  }
])

profile_comments = ProfileComment.create([
  {
    content: "Hello you",
    profile_commentor: users[5],
    profile_commentee: users[4]
  },
  {
    content: "Hi!",
    profile_commentor: users[5],
    profile_commentee: users[3]
  },
  {
    content: "Amazing bet!",
    profile_commentor: users[5],
    profile_commentee: users[2]
  },
  {
    content: "Good thing I followed",
    profile_commentor: users[5],
    profile_commentee: users[1]
  },
  {
    content: "You're the best",
    profile_commentor: users[5],
    profile_commentee: users[0]
  },
  {
    content: "I hate you",
    profile_commentor: users[4],
    profile_commentee: users[3]
  },
  {
    content: "Let's have dinner together",
    profile_commentor: users[4],
    profile_commentee: users[2]
  },
  {
    content: "Hi dude",
    profile_commentor: users[4],
    profile_commentee: users[1]
  },
  {
    content: "Do you bet?",
    profile_commentor: users[4],
    profile_commentee: users[0]
  },
  {
    content: "I win!",
    profile_commentor: users[3],
    profile_commentee: users[2]
  },
  {
    content: "You rock, man!",
    profile_commentor: users[3],
    profile_commentee: users[1]
  },
  {
    content: "Ok, a last one.",
    profile_commentor: users[3],
    profile_commentee: users[0]
  }
])

followings = Following.create([
  {
    follower: users[0],
    followee: users[1]
  },
  {
    follower: users[0],
    followee: users[2]
  },
  {
    follower: users[0],
    followee: users[3]
  },
  {
    follower: users[0],
    followee: users[4]
  },
  {
    follower: users[0],
    followee: users[5]
  },
  {
    follower: users[1],
    followee: users[2]
  },
  {
    follower: users[1],
    followee: users[3]
  },
  {
    follower: users[1],
    followee: users[4]
  },
  {
    follower: users[1],
    followee: users[5]
  },
  {
    follower: users[2],
    followee: users[3]
  },
  {
    follower: users[2],
    followee: users[4]
  },
  {
    follower: users[2],
    followee: users[5]
  }
])