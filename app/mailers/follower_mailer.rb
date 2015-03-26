class FollowerMailer < ApplicationMailer
  default from: 'no-reply@tiy-farmers-market.herokuapp.com'
  
  def new_crop_mail
    @followers = followers.first.user
    mail(to: @followers.email, subject: 'Your farmer has uploaded new crops')
  end
end
