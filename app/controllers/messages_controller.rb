class MessagesController < ApplicationController
  def create
    if current_user
      if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
          @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
          redirect_to "/rooms/#{@message.room_id}"
      else
          redirect_back(fallback_location: root_path)
      end
    elsif current_staff
      if Entry.where(:user_id => current_staff.id, :room_id => params[:message][:room_id]).present?
          @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:staff_id => current_staff.id))
          redirect_to "/rooms/#{@message.room_id}"
      else
          redirect_back(fallback_location: root_path)
      end
    else
        redirect_to root_path, notice: "無効なURLです。"
    end
  end
end
