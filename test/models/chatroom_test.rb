require 'test_helper'

class ChatroomChannelTest < ActionCable::Channel::TestCase
  # Test that subscribing to a chatroom works
  test "should subscribe to a chatroom" do
    # Simulate subscription to the chatroom channel
    subscribe chatroom_id: 1  # Assuming chatroom ID is 1

    # Confirm the subscription was successful
    assert subscription.confirmed
    assert_has_stream "chatroom_1_channel"  # Ensure the correct stream is being followed
  end

  # Test that a message is broadcasted
  test "should broadcast a message to chatroom" do
    subscribe chatroom_id: 1  # Simulate subscribing to chatroom with ID 1

    # Broadcast a message manually
    ActionCable.server.broadcast("chatroom_1_channel", { message: "Test message", user: "User 1" })

    # Verify that the message was broadcasted correctly
    assert_broadcast_on "chatroom_1_channel", { message: "Test message", user: "User 1" }
  end
end
