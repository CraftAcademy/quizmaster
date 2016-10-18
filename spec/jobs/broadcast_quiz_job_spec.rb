require 'rails_helper'

RSpec.describe BroadcastQuizJob, type: :job do
  it 'matches with enqueued job' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      BroadcastQuizJob.perform_later
    }.to have_enqueued_job(BroadcastQuizJob)
  end
end
