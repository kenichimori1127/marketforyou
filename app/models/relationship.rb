class Relationship < ApplicationRecord
  # ユーザーがフォローする場合
  FOLLOW_USER = 0
  # スタッフがフォローする場合
  FOLLOW_STAFF = 1

  # staff_idとuser_idでユニークとする
  validates :staff_id, uniqueness: {scope: [:user_id, :user_type]}

  # 相互フォローしているかどうか
  def self.followed_each_other?(staff_id, user_id)
    relationships = Relationship.where(staff_id: staff_id, user_id: user_id)
    if relationships.count >= 2
      return true
    else
      return false
    end
  end

  # 相手をフォローしているかどうか
  def self.followed?(staff_id, user_id, user_type)
    relationship = Relationship.find_by(user_type: user_type, staff_id: staff_id, user_id: user_id)
    if relationship.present?
      return true
    else
      return false
    end
  end
end
