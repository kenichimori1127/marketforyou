class RoomsController < ApplicationController
  def create
    @room = Room.create
    if current_user
      @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
      @entry2 = Entry.create(params.require(:entry).permit(:staff_id, :room_id).merge(:room_id => @room.id))
      redirect_to "/rooms/#{@room.id}"
    elsif current_staff
      @entry1 = Entry.create(:room_id => @room.id, :staff_id => current_staff.id)
      @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
      redirect_to "/rooms/#{@room.id}"
    else
      redirect_to root_path, notice: "メッセージルームを作成できませんでした。"
    end
  end

  def show
    @room = Room.find(params[:id])
    if current_user
      if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
        @messages = @room.messages
        @message = Message.new
        @entries = @room.entries
      else
        redirect_back(fallback_location: root_path)
      end
    elsif current_staff
      if Entry.where(:staff_id => current_staff.id, :room_id => @room.id).present?
        @messages = @room.messages
        @message = Message.new
        @entries = @room.entries
      else
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_to root_path, notice: "無効なURLです。"
    end
  end
end
