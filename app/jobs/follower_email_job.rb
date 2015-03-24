class FollowerEmailJob < ActiveJob::Base
  queue_as :default

  def perform(follower_email)
    FollowerMailer.follower_email.deliver_now
  end
end
