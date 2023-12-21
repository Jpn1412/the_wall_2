class MessagesController < ApplicationController
  def save_message
    validations = "Message can't be blank" if message_params.values.any? { |value| value.nil? || value.empty? }

    if validations.nil?
      message = Message.save_message(message_params)
      flash[:notice] = 'Message Added' if message.present?
    else
      flash[:notice] = validations
    end
    redirect_to '/blog'
  end

  def edit_page
    @user = session[:user]
    @message = Message.get_message(params[:id])
  end

  def update_message
    validations = "Message can't be blank" if message_params.values.any? { |value| value.nil? || value.empty? }

    if validations.nil?
      message = Message.update_message(message_params)
      flash[:notice] = 'Message updated' if message.present?
    else
      flash[:notice] = validations
    end
    redirect_to '/blog'
  end

  def delete_message
    validations = Message.validate_delete(message_delete)

    if validations.empty?
      flash[:notice] = 'Message not Found/Contact Author'
    else
      Message.delete(message_delete)
      flash[:notice] = "Message Deleted"
    end
    redirect_to '/blog'
  end

  private

  def message_params
    params.require(:review).permit(:user_id, :content)
  end

  def message_delete
    params.require(:message_delete).permit(:message_id, :user_id)
  end
end
