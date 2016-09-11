class UserMailer < ApplicationMailer
  default from: 'admin@helperhood.com'

  def welcome_email(user)
    @user = user
    @nonprofit_url = "http://www.helperhood.com/profile/nonprofit/new"
    @resident_url = "http://www.helperhood.com/profile/resident/new"
    mail(to: @user.email, subject: 'Welcome to Helperhood!')
  end
end
