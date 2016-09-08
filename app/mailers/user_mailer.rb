class UserMailer < ApplicationMailer
  default from: 'notifications@helperhood.com'

  def welcome_email(user)
    @user = user
    @url = "http://www.helperhood.com/email_confirmation"
    mail(to: @user.email, subject: 'Welcome to Helperhood!')
  end
end
