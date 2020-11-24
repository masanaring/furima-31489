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
end

