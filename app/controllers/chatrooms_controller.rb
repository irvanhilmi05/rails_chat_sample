class ChatroomsController < ApplicationController
    def show
      @chatroom = Chatroom.find(params[:id])
      if @chatroom.nil?
        flash[:alert] = "Chatroom not found"
        redirect_to root_path
      else
        @message = Message.new
        @messages = @chatroom.messages
      end
    end
  end
  