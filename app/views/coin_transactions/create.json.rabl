object false

child @coin_transactions => :coin_transactions do
  attributes :id, :user_id, :before_value, :after_value, :transaction_type, :bet_reference
end