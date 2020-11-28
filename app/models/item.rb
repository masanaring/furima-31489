class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:status,:shipping_charge,:delivery_area,:days_to_ship

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
   end

  with_options presence: true, format: { with: /[0-9]/, message: '半角数字を使用してください' } do
    validates :price
  end

  validates :price,numericality: {
    greater_than_or_equal_to: 300,
    less_than: 9999999
  }

  with_options presence: true,numericality: { other_than: 1 } do
   validates :category_id,:status_id,:shipping_charge_id,:delivery_area_id,:days_to_ship_id  
  end

  # validate :image_presence


  # def image_presence
  #     errors.add(:image, 'ファイルを添付してください') unless item.image.attached?
  # end
  

end
