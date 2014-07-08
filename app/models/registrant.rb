class Registrant < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }


# FROM RASTAMAN:

  TIME_UNTIL_EXPIRE = 24.hours

  before_create :set_registration_code_and_expiration
  before_save :downcase_email

  # field :email
  # field :registration_code
  # field :registration_expires_at, type: Time

  validates :email, presence: true, format: { with: EMAIL_REGEX }

  def self.find_by_code(registration_code)
    Registrant.where( :registration_expires_at.lt => Time.now ).destroy_all
    if registrant = Registrant.find_by( :registration_code => registration_code )
      registrant.registration_expires_at = Time.now + TIME_UNTIL_EXPIRE
      registrant.save
      registrant
    end
  end

  protected

  def set_registration_code_and_expiration
    self.registration_code = SecureRandom.urlsafe_base64
    self.registration_expires_at = Time.now + TIME_UNTIL_EXPIRE
  end

  def downcase_email
    self.email.downcase!
  end
end
