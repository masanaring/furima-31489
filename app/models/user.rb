class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :encrypted_password,   presence: true
  validates :first_name,           presence: true
  validates :family_name,          presence: true
  validates :first_name_furigana,  presence: true
  validates :family_name_furigana, presence: true
  validates :birthday,             presence: true

  with_options presence: true, format: { with: /[ァ-ン]/, message: '全角カナ文字を使用してください' } do
    validates :first_name_furigana
    validates :family_name_furigana
  end
  with_options presence: true, format: { with: /[a-z\d]{6,}/i, message: '半角英数字を使用してください' } do
    validates :encrypted_password, presence: true
  end
end
