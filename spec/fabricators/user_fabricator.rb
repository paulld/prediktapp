Fabricator(:user) do
  email { Faker::Internet.email }
  # password { "!QAZxsw2" }
  # password_confirmation { "!QAZxsw2" }
end
