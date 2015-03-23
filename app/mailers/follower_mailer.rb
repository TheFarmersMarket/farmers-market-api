class FollowerMailer < ApplicationMailer
  default from: 'tiy-farmers-market.herokuapp.com'
  
  def follower_email
    @customer = 
    mail(to: @customer.email, subject: 'something')
  end
end
