class FollowerEmailJob < ActiveJob::Base
  queue_as :default


  def perform(followers, crop)
    followers.each do |f|
      FollowerMailer.new_crop_mail(f, crop).deliver_now
    end
  end
end
