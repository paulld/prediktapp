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
    starts_at: "2014-07-11 12:06:54 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
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
    home_score: 3,
    away_score: 1
  },
  {
    league: leagues[0],
    home_team: "Spain",
    away_team: "Portugal",
    home_team_iso_code: "es",
    away_team_iso_code: "pt",
    starts_at: "2014-07-13 9:30:00 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
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
    home_score: 2,
    away_score: 2
  },
  {
    league: leagues[1],
    home_team: "England",
    away_team: "France",
    home_team_iso_code: "gb",
    away_team_iso_code: "fr",
    starts_at: "2014-07-15 10:15:00 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
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
    home_score: 0,
    away_score: 1
  },
  {
    league: leagues[1],
    home_team: "Brazil",
    away_team: "Germany",
    home_team_iso_code: "br",
    away_team_iso_code: "de",
    starts_at: "2014-04-11 21:00:00 +0800",
    ends_at: "2014-04-11 19:00:00 +0800",
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
    home_score: 1,
    away_score: 7
  },
  {
    league: leagues[1],
    home_team: "Italy",
    away_team: "Hong Kong",
    home_team_iso_code: "it",
    away_team_iso_code: "hk",
    starts_at: "2014-07-16 8:30:00 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
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
    home_score: 6,
    away_score: 1
  }
])

bets = Bet.create([
  {
    user: users[0],
    match: matches[1],
    bet_type: "Home",
    wager: 20,
    result: true
  },
  {
    user: users[0],
    match: matches[2],
    bet_type: "Home Handicap",
    wager: 10,
    result: false
  },
  {
    user: users[1],
    match: matches[1],
    bet_type: "Away",
    wager: 20,
    result: false
  },
  {
    user: users[1],
    match: matches[2],
    bet_type: "Away Handicap",
    wager: 10,
    result: true
  },
  {
    user: users[1],
    match: matches[2],
    bet_type: "Away",
    wager: 20,
    result: true
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