class StaffsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def show
    @staff = Staff.find(params[:id])
    if current_user
      @currentEntries = Entry.where(user_id: current_user.id)
      @staffEntries = Entry.where(staff_id: @staff.id)
      @currentEntries.each do |currentEntry|
        @staffEntries.each do |staffEntry|
          if currentEntry.room_id == staffEntry.room_id
            @isRoom = true
            @roomId = currentEntry.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    elsif current_staff
      # スタッフ同士のメッセージは不要
    end
  end

  def index
    staffs = Staff.all

    @staff_array = {}
    staffs.each do |staff|
      if !Relationship.followed?(staff.id, current_user.id, Relationship::FOLLOW_USER)
        @staff_array[staff.nickname] = staff.id
      end
    end
  end
end
