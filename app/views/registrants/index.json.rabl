object false

child @objects do
  attributes :id, :email, :registration_code, :registration_expires_at, :created_at, :updated_at

  node :href do |registrant|
    registrant_url(registrant)
  end
end

node :meta do
  { "client-ids" => true }
end