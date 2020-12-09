FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefghijk00000000000000000' }
    price { 500 }
    postal_code { '123-4567' }
    prefecture_id { 5 }
    city { '東京都' }
    address { '世田谷' }
    phone_number { '09012345678' }
    building_name { '東京ハイツ' }
  end
end
