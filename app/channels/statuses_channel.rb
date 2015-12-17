class StatusesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'statuses'
  end
end
