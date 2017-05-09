class Message < ApplicationRecord
  
  belongs_to :user
  belongs_to :dialect
  
  validates :text, presence: true
  
  after_create_commit { MessageBroadcastJob.perform_later self }
  
end
