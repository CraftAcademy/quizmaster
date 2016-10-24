class BroadcastMobileJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'quiz_channel_mobile', mobile_data: data
    # ActionCable.server.broadcast 'quiz_channel', 'Hello there!'
  end

end
