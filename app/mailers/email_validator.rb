class EmailValidator < ActionMailer::Base
  default from: 'admin@predikt.com'

  def complete_registration(registrant)
    @url = "http://localhost:3000/register/#{registrant.registration_code}"
    # @email = registrant.email
    # mail to: @email,
    #   subject: "Please complete your registration to Rastaman!"
  end

  def password_reset(user)
    @url = "http://localhost:3000/reset/#{user.password_reset_code}"
    # @email = user.email
    # mail to: @email,
    #   subject: "Please reset your password for Rastaman!"
  end
end