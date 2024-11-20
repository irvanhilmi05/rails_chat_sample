require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Test if a message is valid with content
  test "should be valid with content" do
    message = Message.new(content: "Hello, world!")
    assert message.valid?
  end

  # Test if a message is invalid without content
  test "should not be valid without content" do
    message = Message.new(content: "")
    assert_not message.valid?
  end

  # Test if a message belongs to a chatroom
  test "should belong to a chatroom" do
    chatroom = Chatroom.create(name: "General")
    message = chatroom.messages.create(content: "Test message")
    assert_equal message.chatroom, chatroom
  end
end
