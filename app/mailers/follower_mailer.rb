class FollowerMailer < ApplicationMailer

  def follower_email
    @user = user
    mail(to: @customer.email, subject: 'Farmer has uploaded crops')
  end
end
