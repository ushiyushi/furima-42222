require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複した email だと無効' do
        @user.save
        another = FactoryBot.build(:user, email: @user.email)
        another.valid?
        expect(another.errors[:email]).to include("has already been taken")
      end
      it '@が含まれていないと登録できない' do
        @user.email = 'aaaaaaa'
        expect(@user).not_to be_valid 
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = @user.password_confirmation = 'a1b2c'
        expect(@user).not_to be_valid
      end
      it 'password_confirmation と一致していないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc124'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it '英字のみでは登録できない' do
        @user.password = @user.password_confirmation = 'abcdef'
        expect(@user).not_to be_valid
      end
      it '数字のみでは登録できない' do
        @user.password = @user.password_confirmation = '123456'
        expect(@user).not_to be_valid
      end
      it '全角だと登録できない' do
        @user.password = @user.password_confirmation = 'ａｂｃ１２３'
        expect(@user).not_to be_valid
      end
      it "name_seiが空では登録できない" do
        @user.name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei can't be blank")
      end
      it 'name_seiは半角文字では登録できない' do
        @user.name_sei = 'Yamada'
        @user.valid?
        expect(@user.errors[:name_sei]).to include('is invalid. Input full-width characters')
      end
      it "name_meiが空では登録できない" do
        @user.name_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei can't be blank")
      end
      it 'name_meiは半角文字では登録できない' do
        @user.name_mei = 'Taro'
        @user.valid?
        expect(@user.errors[:name_mei]).to include('is invalid. Input full-width characters')
      end
      it "kana_seiが空では登録できない" do
        @user.kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana sei can't be blank")
      end
      it 'kana_seiはカタカナ以外では登録できない' do
        @user.kana_sei = 'やま田'
        expect(@user).not_to be_valid
      end
      it "kana_meiが空では登録できない" do
        @user.kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana mei can't be blank")
      end
      it 'kana_meiはカタカナ以外では登録できない' do
        @user.kana_mei = '太ろう'
        expect(@user).not_to be_valid
      end
      it 'birthday が空だと無効' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
    end
  end
end
