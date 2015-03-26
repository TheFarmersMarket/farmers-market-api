class NewCropEmailJob < ActiveJob::Base
  queue_as :default

  def perform(followers)
    followers.each do |f|
    FollowerMailer.new_crop_mail.deliver_now
    end
  end
end
