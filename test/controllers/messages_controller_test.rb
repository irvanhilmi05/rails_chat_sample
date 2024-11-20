require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatroom = chatrooms(:one)  # Assuming you have a fixture or factory for chatrooms
  end

  test "should create message" do
    assert_difference('Message.count', 1) do
      post chatroom_messages_url(@chatroom), params: { message: { content: "Test message" } }
    end
    assert_redirected_to chatroom_url(@chatroom)
  end

  test "should not create message with empty content" do
    assert_no_difference('Message.count') do
      post chatroom_messages_url(@chatroom), params: { message: { content: "" } }
    end
    assert_response :unprocessable_entity
  end
end
