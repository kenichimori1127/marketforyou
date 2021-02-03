class StaffsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def show
    @staff = Staff.find(params[:id])
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
