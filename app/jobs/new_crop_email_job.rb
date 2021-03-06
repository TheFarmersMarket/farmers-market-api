class NewCropEmailJob < ActiveJob::Base
  queue_as :default

  def perform(followers)
    FollowerMailer.new_crop_mail(followers).deliver_now
  end
end
