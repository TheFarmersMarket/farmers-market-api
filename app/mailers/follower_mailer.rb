class FollowerMailer < ApplicationMailer
  default from: 'no-reply@tiy-farmers-market.herokuapp.com'
  
  def new_crop_mail
    @user = @followers
    mail(to: @user.email, subject: 'Your farmer has uploaded new crops')
  end
end
