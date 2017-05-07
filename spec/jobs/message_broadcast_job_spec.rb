require 'rails_helper'

RSpec.describe MessageBroadcastJob, type: :job do
  describe "#perform_later" do
    
    subject(:job) { described_class.perform_later(message) }
    let(:message) { create(:message) }

    it 'queues the job' do
      ActiveJob::Base.queue_adapter = :test
      expect { job }.to have_enqueued_job(described_class)
        .with(message)
        .on_queue("default")
    end
    
  end
end
