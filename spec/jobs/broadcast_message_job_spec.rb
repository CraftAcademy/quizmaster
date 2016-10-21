require 'rails_helper'

RSpec.describe BroadcastMessageJob, type: :job do
  it 'matches with enqueued job' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      BroadcastMessageJob.perform_later('test')
    }.to have_enqueued_job.with('test')
  end
end
