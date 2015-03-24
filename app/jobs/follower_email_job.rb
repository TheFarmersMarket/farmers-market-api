class FollowerEmailJob < ActiveJob::Base
  queue_as :default

  def perform()
    FollowerMailer.follower_email.deliver_now
  end
end
