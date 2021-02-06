class RelationshipsController < ApplicationController
  def create
    relationships_params = set_params
    relationships = Relationship.new(user_type: relationships_params[:user_type], staff_id: relationships_params[:staff_id], user_id: relationships_params[:user_id])

    if relationships.save
      redirect_to get_redirect_path, notice: 'フォローしました。'
    else
      redirect_to get_redirect_path, alert: 'フォローできませんでした。'
    end
  end

  def destroy
    relationships_params = set_params
    relationship = Relationship.find_by(user_type: relationships_params[:user_type], staff_id: relationships_params[:staff_id], user_id: relationships_params[:user_id])

    if relationship.present?
      relationship.destroy
      redirect_to get_redirect_path, notice: 'フォローを解除しました。'
    else
      redirect_to get_redirect_path, alert: 'フォローを解除できませんでした。'
    end
  end

  private
  def set_params
    params_hash = {}
    user_type = get_user_type

    # Staffがフォローする動作を行った場合
    if user_type == 'staff'
      params_hash[:staff_id] = current_staff.id
      params_hash[:user_id] = params[:user_id]
      params_hash[:user_type] = Relationship::FOLLOW_STAFF
    elsif user_type == 'user'
      params_hash[:staff_id] = params[:staff_id]
      params_hash[:user_id] = current_user.id
      params_hash[:user_type] = Relationship::FOLLOW_USER
    end

    return params_hash
  end

  # ユーザーのタイプ(user・staff)を取得(0: user, 1: staff)
  def get_user_type
    if current_staff
      return 'staff'
    elsif current_user
      return 'user'
    end
  end

  # リダイレクト先を取得(User or Staff)
  def get_redirect_path
    if get_user_type == "staff"
      return "/users/#{params[:user_id]}"
    elsif get_user_type == "user"
      return "/staffs/#{params[:staff_id]}"
    end
  end
end
