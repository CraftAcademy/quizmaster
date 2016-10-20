class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'quiz_channel', data
  end
end