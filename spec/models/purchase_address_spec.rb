require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    sleep(1)
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@purchase_address).to be_valid
      end
      it "buildingは空でも保存できること" do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "post_codeが空では登録できないこと" do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと" do
        @purchase_address.post_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では登録できないこと" do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "street_addressが空では登録できないこと" do
        @purchase_address.street_address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end
      it "phoneが空では登録できないこと" do
        @purchase_address.phone = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it "phoneが9桁以下では登録できないこと" do
        @purchase_address.phone = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid.")
      end
      it "phoneが12桁以上では登録できないこと" do
        @purchase_address.phone = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid.")
      end
      it "phoneが半角数字でないと登録できないこと" do
        @purchase_address.phone = "０９０１２３４５６７８"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
