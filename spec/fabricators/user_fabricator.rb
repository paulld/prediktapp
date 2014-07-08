Fabricator(:user) do
  email { Faker::Internet.email }
  user_name { Faker::Lorem.word }
  # password { "!QAZxsw2" }
  # password_confirmation { "!QAZxsw2" }
end
