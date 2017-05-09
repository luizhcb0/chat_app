class User < ApplicationRecord
  
  has_many :messages
  belongs_to :dialect
  
  validates :username, presence: true
  
  def online?
    $redis_onlines.exists( self.id )
  end
  
end
