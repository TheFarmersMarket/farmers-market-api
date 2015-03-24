class FollowerMailer < ApplicationMailer
  default from: 'no-reply@tiy-farmers-market.herokuapp.com'
  
  def follower_email
    @user = user
    mail(to: @user.email, subject: 'Farmer has uploaded crops')
  end
end
