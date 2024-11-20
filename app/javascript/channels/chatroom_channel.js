import consumer from "./consumer"

const chatroomId = document.getElementById('chatroom-id').dataset.id;

consumer.subscriptions.create({ channel: "ChatroomChannel", chatroom_id: chatroomId }, {
  received(data) {
    const messageElement = document.createElement('div');
    messageElement.innerText = `${data.user}: ${data.message}`;
    document.getElementById('messages').appendChild(messageElement);
  }
});
