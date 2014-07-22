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
    email: "robert@predikt.com",
    coins: 1250,
    win_percentage: 0.55
  },
  {
    user_name: "Rage",
    email: "regis@predikt.com",
    coins: 1100,
    win_percentage: 0.55
  },
  {
    user_name: "Felix",
    email: "felix@predikt.com",
    coins: 1200,
    win_percentage: 0.60
  },
  {
    user_name: "Tim",
    email: "timmy@predikt.com",
    coins: 950,
    win_percentage: 0.45
  },
  {
    user_name: "Vlad",
    email: "vladimir@predikt.com",
    coins: 888,
    win_percentage: 0.35
  },
  {
    user_name: "kate",
    email: "missk@predikt.com",
    coins: 1980,
    win_percentage: 0.71
  }
])

coin_transactions = CoinTransaction.create([
  { 
    user: users[0],
    before_value: 0,
    after_value: 10,
    transaction_type: "init"
  },
  { 
    user: users[0],
    before_value: 10,
    after_value: 20,
    transaction_type: "bet_win"
  },
  { 
    user: users[0],
    before_value: 20,
    after_value: 10,
    transaction_type: "bet_loss"
  },
  { 
    user: users[0],
    before_value: 10,
    after_value: 15,
    transaction_type: "bet_win"
  },
  { 
    user: users[1],
    before_value: 0,
    after_value: 10,
    transaction_type: "init"
  },
  { 
    user: users[1],
    before_value: 10,
    after_value: 12,
    transaction_type: "bet_win"
  },
  { 
    user: users[1],
    before_value: 12,
    after_value: 5,
    transaction_type: "bet_loss"
  },
  { 
    user: users[1],
    before_value: 5,
    after_value: 2,
    transaction_type: "bet_loss"
  }
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
    league: leagues[0],
    home_team: "Brazil",
    away_team: "Argentina",
    home_team_iso_code: "br",
    away_team_iso_code: "ar",
    starts_at: "2014-05-01 12:00:00 +0800",
    ends_at: "2014-05-01 13:45:00 +0800",
    home_odds: 1.95,
    draw_odds: 3.40,
    away_odds: 3.15,
    over_under_value: 3.5,
    over_odds: 1.78,
    under_odds: 2.56,
    home_handicap_value: -0.5,
    away_handicap_value: +0.5,
    home_handicap_odds: 2.08,
    away_handicap_odds: 1.78,
    match_status: "completed",
    home_draw_away: "home",
    home_score: 3,
    away_score: 1
  },
  {
    league: leagues[0],
    home_team: "Spain",
    away_team: "Portugal",
    home_team_iso_code: "es",
    away_team_iso_code: "pt",
    starts_at: "2014-06-01 9:30:00 +0800",
    ends_at: "2014-06-01 11:15:00 +0800",
    home_odds: 1.78,
    draw_odds: 4.22,
    away_odds: 2.15,
    over_under_value: 2.5,
    over_odds: 1.82,
    under_odds: 2.34,
    home_handicap_value: -2.5,
    away_handicap_value: +2.5,
    home_handicap_odds: 1.84,
    away_handicap_odds: 2.0,
    match_status: "completed",
    home_draw_away: "draw",
    home_score: 2,
    away_score: 2
  },
  {
    league: leagues[1],
    home_team: "England",
    away_team: "France",
    home_team_iso_code: "gb",
    away_team_iso_code: "fr",
    starts_at: "2014-07-01 10:15:00 +0800",
    ends_at: "2014-07-01 12:00:00 +0800",
    home_odds: 2.55,
    draw_odds: 3.72,
    away_odds: 2.18,
    over_under_value: 2.5,
    over_odds: 1.90,
    under_odds: 3.9,
    home_handicap_value: -3.5,
    away_handicap_value: +3.5,
    home_handicap_odds: 1.92,
    away_handicap_odds: 1.88,
    match_status: "completed",
    home_draw_away: "away",
    home_score: 0,
    away_score: 1
  },
  {
    league: leagues[1],
    home_team: "Brazil",
    away_team: "Germany",
    home_team_iso_code: "br",
    away_team_iso_code: "de",
    starts_at: "2014-09-08 21:00:00 +0800",
    ends_at: "2014-09-08 19:00:00 +0800",
    home_odds: 1.47,
    draw_odds: 6.72,
    away_odds: 4.82,
    over_under_value: 3.5,
    over_odds: 1.48,
    under_odds: 1.98,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 4.58,
    away_handicap_odds: 1.62,
    match_status: "pending"
  },
  {
    league: leagues[1],
    home_team: "Italy",
    away_team: "Hong Kong",
    home_team_iso_code: "it",
    away_team_iso_code: "hk",
    starts_at: "2014-10-11 8:30:00 +0800",
    ends_at: "2014-10-11 10:30:00 +0800",
    home_odds: 1.47,
    draw_odds: 6.72,
    away_odds: 4.82,
    over_under_value: 3.5,
    over_odds: 1.48,
    under_odds: 1.98,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.62,
    away_handicap_odds: 4.58,
    match_status: "pending"
  },
  {
    league: leagues[1],
    home_team: "Canada",
    away_team: "Switerland",
    home_team_iso_code: "ca",
    away_team_iso_code: "ch",
    starts_at: "2014-10-08 8:30:00 +0800",
    ends_at: "2014-10-08 10:30:00 +0800",
    home_odds: 1.7,
    draw_odds: 6.2,
    away_odds: 4.2,
    over_under_value: 4.5,
    over_odds: 1.38,
    under_odds: 1.18,
    home_handicap_value: -2.5,
    away_handicap_value: +2.5,
    home_handicap_odds: 1.62,
    away_handicap_odds: 4.58,
    match_status: "pending"
  },
  {
    league: leagues[1],
    home_team: "French Guiana",
    away_team: "Equatorial Guinea",
    home_team_iso_code: "gf",
    away_team_iso_code: "gq",
    starts_at: "2014-09-09 8:30:00 +0800",
    ends_at: "2014-09-09 10:30:00 +0800",
    home_odds: 1.57,
    draw_odds: 6.92,
    away_odds: 4.22,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.83,
    away_handicap_odds: 4.52,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "San Jose Earthquakes",
    away_team: "Chicago Fire",
    home_team_iso_code: "sj",
    away_team_iso_code: "chi",
    starts_at: "2014-07-24 10:30:00 +0800",
    ends_at: "2014-07-24 12:30:00 +0800",
    home_odds: 2.16,
    draw_odds: 3.26,
    away_odds: 3.29,
    over_under_value: 2.5,
    over_odds: 1.9,
    under_odds: 1.9,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.83,
    away_handicap_odds: 2.52,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Real Salt Lake",
    away_team: "Montreal Impact",
    home_team_iso_code: "rsl",
    away_team_iso_code: "mtl",
    starts_at: "2014-07-25 10:00:00 +0800",
    ends_at: "2014-07-25 12:00:00 +0800",
    home_odds: 1.67,
    draw_odds: 3.68,
    away_odds: 4.89,
    over_under_value: 2.5,
    over_odds: 1.77,
    under_odds: 1.38,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.11,
    away_handicap_odds: 4.94,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Colorado Rapids",
    away_team: "Chivas USA",
    home_team_iso_code: "col",
    away_team_iso_code: "chv",
    starts_at: "2014-07-26 9:30:00 +0800",
    ends_at: "2014-07-26 11:30:00 +0800",
    home_odds: 1.72,
    draw_odds: 3.55,
    away_odds: 4.62,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.92,
    away_handicap_odds: 2.33,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Toronto FC",
    away_team: "Sporting Kansas City",
    home_team_iso_code: "tor",
    away_team_iso_code: "skc",
    starts_at: "2014-07-27 7:00:00 +0800",
    ends_at: "2014-07-27 9:00:00 +0800",
    home_odds: 2.59,
    draw_odds: 3.55,
    away_odds: 2.66,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.83,
    away_handicap_odds: 1.9,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "New England Revolution",
    away_team: "Columbus Crew",
    home_team_iso_code: "ne",
    away_team_iso_code: "clb",
    starts_at: "2014-07-27 7:30:00 +0800",
    ends_at: "2014-07-27 9:30:00 +0800",
    home_odds: 1.85,
    draw_odds: 3.25,
    away_odds: 4.65,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.85,
    away_handicap_odds: 1.85,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Vancouver Whitecaps FC",
    away_team: "FC Dallas",
    home_team_iso_code: "van",
    away_team_iso_code: "dal",
    starts_at: "2014-07-28 5:00:00 +0800",
    ends_at: "2014-07-28 7:00:00 +0800",
    home_odds: 2.05,
    draw_odds: 3.33,
    away_odds: 3.37,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.89,
    away_handicap_odds: 1.96,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Montreal Impact",
    away_team: "Portland Timbers",
    home_team_iso_code: "mtl",
    away_team_iso_code: "por",
    starts_at: "2014-07-28 8:00:00 +0800",
    ends_at: "2014-07-28 10:00:00 +0800",
    home_odds: 2.05,
    draw_odds: 3.33,
    away_odds: 2.90,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.76,
    away_handicap_odds: 2.33,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "Seattle Sounders FC",
    away_team: "LA Galaxy",
    home_team_iso_code: "sea",
    away_team_iso_code: "la",
    starts_at: "2014-07-28 10:00:00 +0800",
    ends_at: "2014-07-28 12:00:00 +0800",
    home_odds: 2.40,
    draw_odds: 3.25,
    away_odds: 3.33,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.97,
    away_handicap_odds: 2.42,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "D.C. United",
    away_team: "Toronto FC",
    home_team_iso_code: "dc",
    away_team_iso_code: "tor",
    starts_at: "2014-07-30 7:00:00 +0800",
    ends_at: "2014-07-30 9:00:00 +0800",
    home_odds: 1.32,
    draw_odds: 5.32,
    away_odds: 6.11,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 3.83,
    away_handicap_odds: 1.52,
    match_status: "pending"
  },
  {
    league: leagues[2],
    home_team: "New England Revolution",
    away_team: "Colorado Rapids",
    home_team_iso_code: "ne",
    away_team_iso_code: "col",
    starts_at: "2014-07-30 7:30:00 +0800",
    ends_at: "2014-07-30 9:30:00 +0800",
    home_odds: 1.67,
    draw_odds: 1.92,
    away_odds: 3.77,
    over_under_value: 2.5,
    over_odds: 1.8,
    under_odds: 1.18,
    home_handicap_value: -1.5,
    away_handicap_value: +1.5,
    home_handicap_odds: 1.83,
    away_handicap_odds: 6.92,
    match_status: "pending"
  }
])

bets = Bet.create([
  {
    user: users[0],
    match: matches[0],
    bet_type: "home",
    wager: 20,
    is_successful: true
  },
  {
    user: users[1],
    match: matches[0],
    bet_type: "draw",
    wager: 10,
    is_successful: false
  },
  {
    user: users[0],
    match: matches[1],
    bet_type: "draw",
    wager: 20,
    is_successful: true
  },
  {
    user: users[1],
    match: matches[1],
    bet_type: "draw",
    wager: 10,
    is_successful: true
  },
  {
    user: users[0],
    match: matches[2],
    bet_type: "away",
    wager: 20,
    is_successful: true
  },
  {
    user: users[1],
    match: matches[2],
    bet_type: "draw",
    wager: 10,
    is_successful: false
  },
  {
    user: users[2],
    match: matches[2],
    bet_type: "draw",
    wager: 10,
    is_successful: false
  },
  {
    user: users[0],
    match: matches[3],
    bet_type: "over",
    wager: 20
  },
  {
    user: users[1],
    match: matches[3],
    bet_type: "under",
    wager: 10
  },
  {
    user: users[2],
    match: matches[3],
    bet_type: "home_handicap",
    wager: 10
  },
  {
    user: users[1],
    match: matches[4],
    bet_type: "away_handicap",
    wager: 20
  },
  {
    user: users[2],
    match: matches[4],
    bet_type: "under",
    wager: 10
  },
  {
    user: users[3],
    match: matches[4],
    bet_type: "home_handicap",
    wager: 10
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
    content: "Lorem",
    profile_commentor: users[5],
    profile_commentee: users[2]
  },
  {
    content: "Ipsum",
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