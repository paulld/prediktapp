object false

child [ @current_user ] => :users do
  attributes :id, :email, :user_name, :first_name, :last_name, :description, :home_country, :home_town, :website, :reset_code, :reset_expires_at, :coins, :win_percentage, :current_streak, :created_at, :updated_at
end