class BroadcastQuizJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'quiz_channel', create_partial(data)
  end

  def create_partial(data)
    ApplicationController.renderer.render(partial: './partials/question', locals: {data: data})
  end
end
