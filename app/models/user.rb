class User < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :bets
  has_many :match_comments
  has_many :coin_transactions
  
  has_many :profile_commentors, through: :profile_comments_as_commentors, class_name: "User"
  has_many :profile_commentees, through: :profile_comments_as_commentees, class_name: "User"
  has_many :profile_comments_as_commentors, class_name: "ProfileComment", foreign_key: "profile_commentor_id", dependent: :destroy
  has_many :profile_comments_as_commentees, class_name: "ProfileComment", foreign_key: "profile_commentee_id", dependent: :destroy

  has_many :followers, through: :followings_as_followers, class_name: "User"
  has_many :followees, through: :followings_as_followees, class_name: "User"
  has_many :followings_as_followers, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :followings_as_followees, class_name: "Following", foreign_key: "followee_id", dependent: :destroy
  
  

  TIME_UNTIL_EXPIRE = 24.hours
  

  before_save :encrypt_password if :password
  before_save :downcase_email

  attr_accessor :password, :password_confirmation

  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :user_name, presence: true

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def self.authenticate(email, password)
    user = User.find_by( email: email )   # TODO: remote ()?
    user if user && user.authenticate(password)
  end

  def generate_password_reset_code
    self.password_reset_code = SecureRandom.urlsafe_base64
    self.password_reset_expires_at = TIME_UNTIL_EXPIRE.from_now
    self.save
  end

  def self.find_by_reset_code(password_reset_code)
    User.where( "password_reset_expires_at < ?", Time.now.gmtime ).each do |user|
      user.clear_reset_code
    end
    if user = User.find_by( "password_reset_code = ?", password_reset_code )
    # TODO: diff between (:password_reset_code => password_reset_code) AND (password_reset_code: password_reset_code)  ??
      user.password_reset_expires_at = TIME_UNTIL_EXPIRE.from_now
      user.save
      user
    end
  end

  def update_password(password, password_confirmation)
    self.password = password
    self.password_confirmation = password_confirmation
    self.save
    self
  end

  def clear_reset_code
    self.password_reset_code = ""
    self.password_reset_expires_at = ""
    self.save
  end

  def update_profile(first_name, last_name, user_name)
    self.first_name = first_name
    self.last_name = last_name
    self.user_name = user_name
    self.save
    self
  end

  
  protected

  def encrypt_password
    self.salt = BCrypt::Engine.generate_salt
    self.fish = BCrypt::Engine.hash_secret(password, self.salt)
  end

  def downcase_email
    self.email.downcase!
  end

end