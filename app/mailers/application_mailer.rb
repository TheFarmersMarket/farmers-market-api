class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@tiy-farmers-market.herokuapp.com"
  layout 'mailer'
end
