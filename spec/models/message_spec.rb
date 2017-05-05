require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:text) }
  end
  
  describe "Callbacks" do
    let!(:message) { create(:message) }
    it "perform_later a MessageBroadcastJob" do
      MessageBroadcastJob.perform_later(message)
    end
  end
end
