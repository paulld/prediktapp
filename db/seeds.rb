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
    content: "A comment on the first user",
    profile_commentor: users[1],
    profile_commentee: users[0]
  },
  {
    content: "A comment on the second user",
    profile_commentor: users[0],
    profile_commentee: users[1]
  }
])

followings = Following.create([
  {
    follower: users[1],
    followed: users[0]
  },
  {
    follower: users[0],
    followed: users[1]
  }
])