class QuizChannelMobile < ApplicationCable::Channel
  def subscribed
    stream_from 'quiz_channel_mobile'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
