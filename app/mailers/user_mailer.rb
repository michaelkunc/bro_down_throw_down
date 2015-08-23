class UserMailer < ApplicationMailer


  def welcome_email(user)
    @user = user
    @url = 'http://www.google.com'
    mail(to: @user.email, subject: "Welcome to bro down throw down")
  end


end
