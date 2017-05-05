require 'rails_helper'

RSpec.describe MessageBroadcastJob, type: :job do
  describe "#perform_later" do
    it "uploads a message" do
      ActiveJob::Base.queue_adapter = :test
      MessageBroadcastJob.perform_later('message')
      expect(MessageBroadcastJob).to have_been_enqueued
    end
  end
end
