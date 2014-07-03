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
    email: "robert@predikt.com"
  },
  {
    user_name: "Rage",
    email: "regis@predikt.com"
  },
  {
    user_name: "Felix",
    email: "felix@predikt.com"
  },
  {
    user_name: "Tim",
    email: "timmy@predikt.com"
  },
  {
    user_name: "Vlad",
    email: "vladimir@predikt.com"
  },
  {
    user_name: "kate",
    email: "missk@predikt.com"
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
    away_team: "Argentina"
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
    wager: 20
  },
  {
    user: users[0],
    match: matches[1],
    bet_type: "Home Handicap",
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