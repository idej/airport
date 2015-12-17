class EventJob < ActiveJob::Base
  queue_as :default

  def perform(plane, event)
    plane.public_send("#{event}!")
  end
end
