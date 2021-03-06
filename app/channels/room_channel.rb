class RoomChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(text: data['message'], user_id: current_user.id, dialect_id: current_user.dialect.id)
  end
end
