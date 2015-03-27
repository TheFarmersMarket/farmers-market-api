class FollowerMailer < ApplicationMailer
  default from: 'no-reply@tiy-farmers-market.herokuapp.com'
  
  def new_crop_mail(followers)
    followers.each do |f|
      e = f.user.email unless f.user.nil?
      mail(to: e, subject: 'Your farmer has uploaded new crops') unless e.nil?
    end
  end
end
