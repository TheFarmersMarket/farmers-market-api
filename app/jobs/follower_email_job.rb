class FollowerEmailJob < ActiveJob::Base
  queue_as :default

  def perform()
    # Do something later
  end
end
