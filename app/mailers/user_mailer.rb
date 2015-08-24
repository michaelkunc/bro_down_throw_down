class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = 'http://www.google.com'
    mail(to: @user.email, subject: "Welcome to bro down throw down")
  end

  def challenge_email(current_user, other_user)
    @user = current_user
    @other_user = other_user
    mail(to: @user.email, subject: "You have been challenged!")
  end



end
