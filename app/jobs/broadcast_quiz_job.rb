class BroadcastQuizJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'quiz_channel', message
  end
end
