object false

# This creates an "coin_transactions": [] key-value pair with one or more bet hashes
# Adding the => :coin_transactions ensures that an empty array still displays
child @coin_transactions => :coin_transactions do
  attributes :id, :amount_change, :transaction_type, :bet_reference

  node :links do |coin_transaction|
    {
      user: coin_transaction.user.id
    }
  end

  node :href do |coin_transaction|
    coin_transaction_url(coin_transaction)
  end
end

# :links provides a hash of URL templates to satisfy the hypermedia constraint
node :links do
  {
    "coin_transactions.user" => users_url + "/{coin_transactions.user}"
  }
end

node :meta do
  { "client-ids" => true }
end