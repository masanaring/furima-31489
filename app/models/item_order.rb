class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token, :price

  # addressのバリデーション

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :token
    validates :item_id
    validates :user_id
    validates :address
    validates :phone_number, format: { with: /[0-9]/ },length: { maximum: 11 }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
