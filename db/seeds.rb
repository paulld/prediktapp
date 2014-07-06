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

coin_transactions = CoinTransaction.create([
  { 
    user: users[0],
    amount_change: 10,
    transaction_type: "bet_win"
  },
  { 
    user: users[0],
    amount_change: -5,
    transaction_type: "bet_loss"
  },
  { 
    user: users[0],
    amount_change: 15,
    transaction_type: "bet_win"
  },
  { 
    user: users[1],
    amount_change: 10,
    transaction_type: "bet_win"
  },
  { 
    user: users[1],
    amount_change: -5,
    transaction_type: "bet_loss"
  },
  { 
    user: users[1],
    amount_change: -15,
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
    starts_at: "2014-07-11 12:06:54 +0800",
    ends_at: "2014-07-11 2:06:54 +0800"
  },
  {
    league: leagues[0],
    home_team: "Spain",
    away_team: "Portugal"
  },
  {
    league: leagues[1],
    home_team: "Arsenal",
    away_team: "Manchester United"
  },
  {
    league: leagues[1],
    home_team: "Manchester City",
    away_team: "Chelsea"
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