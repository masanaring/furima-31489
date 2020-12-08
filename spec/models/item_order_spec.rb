require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end

      it 'building_nameが空でも保存できること' do
        @item_order.building_name = nil
        expect(@item_order).to be_valid
      end
    end

    context '商品購入情報が保存できない場合' do
      it 'tokenが空だと保存できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと保存できないこと' do
        @item_order.postal_code = 1_234_567
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が未選択だと登録できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
