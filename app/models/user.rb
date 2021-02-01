class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
    validates :nickname
    validates :email, allow_blank: true
    validates :password, allow_blank: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英文字で入力してください', allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角文字で入力してください', allow_blank: true }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角文字で入力してください', allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角文字で入力してください', allow_blank: true }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角文字で入力してください', allow_blank: true }
    validates :phone_number
  end
end
