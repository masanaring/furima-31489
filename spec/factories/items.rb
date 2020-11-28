FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    shipping_charge_id { 2 }
    delivery_area_id { 2 }
    days_to_ship_id { 2 }
    price { 450 }
    association :user
  end
end
