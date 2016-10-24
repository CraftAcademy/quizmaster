class BroadcastMobileJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'quiz_mobile_channel', mobile_data: data
    # ActionCable.server.broadcast 'quiz_channel', 'Hello there!'
  end

end
