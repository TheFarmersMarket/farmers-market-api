class FollowerMailer < ApplicationMailer
  default from: 'no-reply@tiy-farmers-market.herokuapp.com'
  
  def follower_email
    @user = user
    mail(to: @user.email, subject: 'Your farmer has uploaded new crops')
  end
end
