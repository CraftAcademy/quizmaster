class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "quiz_channel_#{data[:quiz_id]}", data
  end
end