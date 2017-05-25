class MessagesController < ApplicationController
  
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.body,
        user: message.user.first_name
      head :ok
    else
      flash[:danger] = "Sorry! Something went wrong. Please try again."
      redirect_to conversations_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :conversation_id)
    end
end