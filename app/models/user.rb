class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: { with: /[ぁ-んァ-ヶー一-龠]/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: /[ァ-ン]/, message: '全角カナ文字を使用してください' } do
    validates :first_name_furigana
    validates :family_name_furigana
  end
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: '半角英数字を使用してください' } do
    validates :password
  end
end
