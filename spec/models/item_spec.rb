require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品できる場合' do
      it "全項目が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "introductionが空では登録できない" do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "categoryが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "conditionが空では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "feeが空では登録できない" do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "prefectureが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_timeが空では登録できない" do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが￥300～￥9,999,999以外では登録できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end
      it "priceが半角数値以外では登録できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
