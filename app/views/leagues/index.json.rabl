object false

child @objects do
  attributes :id, :name

  # node :links do |league|
  #   {
  #     users: league.users.map {|u| u.id },
  #     jobs: league.jobs.map {|j| j.id }
  #   }
  # end

  node :href do |league|
    league_url(league)
  end
end

# node :links do
#   {
#     "duties.users" => users_url + "/{duties.users}",
#     "duties.jobs" => jobs_url + "/{duties.jobs}"
#   }
# end

node :meta do
  { "client-ids" => true }
end