class UsersController < ApplicationController
  before_action :authenticate_staff!, only: [:index]

  def show
    @user = User.find(params[:id])
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
