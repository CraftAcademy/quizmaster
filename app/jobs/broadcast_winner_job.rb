class BroadcastWinnerJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "quiz_channel_#{data[:quiz].id}", create_partial(data)
  end

  def create_partial(data)
    ApplicationController.renderer.render(partial: './partials/winner', locals: {data: data})
  end
end
