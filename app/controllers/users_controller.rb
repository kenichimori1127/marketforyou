class UsersController < ApplicationController
  before_action :authenticate_staff!, only: [:index]

  def show
    @user = User.find(params[:id])
    if current_staff
      @currentEntries = Entry.where(staff_id: current_staff.id)
      @userEntries = Entry.where(user_id: @user.id)
      @currentEntries.each do |currentEntry|
        @userEntries.each do |userEntry|
          if currentEntry.room_id == userEntry.room_id
            @isRoom = true
            @roomId = currentEntry.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    elsif current_user
      # ユーザー同士のメッセージは不要
    end
  end

  def index
    users = User.all

    @user_array = {}
    users.each do |user|
      if !Relationship.followed?(current_staff.id, user.id, Relationship::FOLLOW_STAFF)
        @user_array[user.nickname] = user.id
      end
    end
  end
end
