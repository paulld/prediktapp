Prediktapp::Application.routes.draw do

  root                     'site#index'

  get 'login'           => 'session#new',             as: :login


  scope :api, defaults: { format: :json } do

    get ''              => 'api#index',               as: :api_root

    get 'uuids'         => 'uuids#create',            as: :uuid
    get 'uuids/:num'    => 'uuids#create',            as: :uuids

    get 'rest'          => 'rest#index',              as: :rest

    scope :bets do
      get    ''         => 'bets#index',              as: :bets
      get    ':ids'     => 'bets#index',              as: :bet
      put    ':id'      => 'bets#create_or_replace'
      patch  ':id'      => 'bets#update'
      delete ':id'      => 'bets#destroy'
    end

    scope :followings do
      get    ''         => 'followings#index',        as: :followings
      get    ':ids'     => 'followings#index',        as: :following
      put    ':id'      => 'followings#create_or_replace'
      patch  ':id'      => 'followings#update'
      delete ':id'      => 'followings#destroy'
    end

    scope :leagues do
      get    ''         => 'leagues#index',           as: :leagues
      get    ':ids'     => 'leagues#index',           as: :league
      put    ':id'      => 'leagues#create_or_replace'
      patch  ':id'      => 'leagues#update'
      delete ':id'      => 'leagues#destroy'
    end

    scope :matches do
      get    ''         => 'matches#index',           as: :matches
      get    ':ids'     => 'matches#index',           as: :match
      put    ':id'      => 'matches#create_or_replace'
      patch  ':id'      => 'matches#update'
      delete ':id'      => 'matches#destroy'
    end

    scope :match_comments do
      get    ''         => 'match_comments#index',    as: :match_comments
      get    ':ids'     => 'match_comments#index',    as: :match_comment
      put    ':id'      => 'match_comments#create_or_replace'
      patch  ':id'      => 'match_comments#update'
      delete ':id'      => 'match_comments#destroy'
    end

    scope :profile_comments do
      get    ''         => 'profile_comments#index',  as: :profile_comments
      get    ':ids'     => 'profile_comments#index',  as: :profile_comment
      put    ':id'      => 'profile_comments#create_or_replace'
      patch  ':id'      => 'profile_comments#update'
      delete ':id'      => 'profile_comments#destroy'
    end

    scope :registrants do
      get    ''         => 'registrants#index',       as: :registrants
      get    ':ids'     => 'registrants#index',       as: :registrant
      put    ':id'      => 'registrants#create_or_replace'
      patch  ':id'      => 'registrants#update'
      delete ':id'      => 'registrants#destroy'
    end

    scope :sports do
      get    ''         => 'sports#index',             as: :sports
      get    ':ids'     => 'sports#index',             as: :sport
      put    ':id'      => 'sports#create_or_replace'
      patch  ':id'      => 'sports#update'
      delete ':id'      => 'sports#destroy'
    end
    
    scope :coin_transactions do
      get    ''         => 'coin_transactions#index',             as: :coin_transactions
      get    ':ids'     => 'coin_transactions#index',             as: :coin_transaction
      put    ':id'      => 'coin_transactions#create_or_replace'
      patch  ':id'      => 'coin_transactions#update'
      delete ':id'      => 'coin_transactions#destroy'
    end
    
    scope :users do
      get    ''         => 'users#index',             as: :users
      get    ':ids'     => 'users#index',             as: :user
      put    ':id'      => 'users#create_or_replace'
      patch  ':id'      => 'users#update'
      delete ':id'      => 'users#destroy'
    end

  end
end