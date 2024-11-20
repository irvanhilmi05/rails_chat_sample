class MessagesController < ApplicationController
    def create
      @chatroom = Chatroom.find(params[:chatroom_id])
  
      # Handle anonymous user name or guest name
      username = params[:message][:username].presence || "Guest_#{rand(1000..9999)}"  # Default name if no username provided
  
      begin
        # Create the message with the content and the anonymous username
        @message = @chatroom.messages.create!(message_params.merge(user_name: username))
  
        # Broadcast the message to the chatroom channel
        ActionCable.server.broadcast("chatroom_#{@chatroom.id}_channel", { user: username, message: @message.content })
  
        # Set success notification
        flash[:notice] = "Message sent successfully!"
  
      rescue ActiveRecord::RecordInvalid => e
        # Handle validation errors, such as empty content
        flash[:alert] = "Error sending message: #{e.message}"
      rescue StandardError => e
        # Handle any other errors
        flash[:alert] = "An unexpected error occurred: #{e.message}"
      end
  
      # Redirect back to the chatroom
      redirect_to @chatroom
    end
  
    private
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  