class Message < ApplicationRecord
  
  validates :text, presence: true
  
  after_create_commit { MessageBroadcastJob.perform_later self }
  
end
