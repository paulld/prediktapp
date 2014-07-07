User.destroy_all
Registrant.destroy_all
Match.destroy_all
League.destroy_all
Following.destroy_all
ProfileComment.destroy_all
MatchComment.destroy_all
Bet.destroy_all

registrant = Registrant.create([
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
    coins: 100,
    win_percentage: 0.50
  },
  {
    user_name: "Rage",
    email: "regis@predikt.com",
    coins: 110,
    win_percentage: 0.55
  },
  {
    user_name: "Felix",
    email: "felix@predikt.com",
    coins: 120,
    win_percentage: 0.60
  },
  {
    user_name: "Tim",
    email: "timmy@predikt.com",
    coins: 95,
    win_percentage: 0.45
  },
  {
    user_name: "Vlad",
    email: "vladimir@predikt.com",
    coins: 10,
    win_percentage: 0.5
  },
  {
    user_name: "kate",
    email: "missk@predikt.com",
    coins: 200,
    win_percentage: 0.71
  }
])

leagues = League.create([
  { name: "World Cup 2014" },
  { name: "Premier league 2014-2015" },
  { name: "Liga 2014-2015" }
])

matches = Match.create([
  {
    league: leagues[0],
    home_team: "Brazil",
    away_team: "Argentina",
    starts_at: "2014-07-11 12:06:54 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
    home_odds: 1.95,
    draw_odds: 3.40,
    away_odds: 3.15,
    over_under_value: 3.5,
    over_under_odds: 1.78,
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
    starts_at: "2014-07-11 12:06:54 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
    home_odds: 1.78,
    draw_odds: 4.22,
    away_odds: 2.15,
    over_under_value: 2.5,
    over_under_odds: 1.78,
    home_handicap_value: -0.5,
    away_handicap_value: +0.5,
    home_handicap_odds: 1.84,
    away_handicap_odds: 2.0,
    home_score: 2,
    away_score: 2
  },
  {
    league: leagues[1],
    home_team: "Arsenal",
    away_team: "Manchester United",
    starts_at: "2014-07-11 12:06:54 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
    home_odds: 2.55,
    draw_odds: 3.72,
    away_odds: 2.18,
    over_under_value: 2.5,
    over_under_odds: 1.90,
    home_handicap_value: -0.5,
    away_handicap_value: +0.5,
    home_handicap_odds: 1.92,
    away_handicap_odds: 1.88,
    home_score: 0,
    away_score: 1
  },
  {
    league: leagues[1],
    home_team: "Manchester City",
    away_team: "Chelsea",
    starts_at: "2014-07-11 12:06:54 +0800",
    ends_at: "2014-07-11 2:06:54 +0800",
    home_odds: 1.47,
    draw_odds: 6.72,
    away_odds: 4.82,
    over_under_value: 3.5,
    over_under_odds: 1.48,
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