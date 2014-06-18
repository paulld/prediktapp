Prediktapi::Application.routes.draw do

  scope defaults: { format: :json } do

    root 'api#index'

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

    scope :follows do
      get    ''         => 'follows#index',           as: :follows
      get    ':ids'     => 'follows#index',           as: :follow
      put    ':id'      => 'follows#create_or_replace'
      patch  ':id'      => 'follows#update'
      delete ':id'      => 'follows#destroy'
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

    scope :users do
      get    ''         => 'users#index',             as: :users
      get    ':ids'     => 'users#index',             as: :user
      put    ':id'      => 'users#create_or_replace'
      patch  ':id'      => 'users#update'
      delete ':id'      => 'users#destroy'
    end

  end
end