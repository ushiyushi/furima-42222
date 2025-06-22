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
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "name_seiが空では登録できない" do
        @user.name_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name sei can't be blank")
      end
      it "name_meiが空では登録できない" do
        @user.name_mei = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name mei can't be blank")
      end
      it "kana_seiが空では登録できない" do
        @user.kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana sei can't be blank")
      end
      it "kana_meiが空では登録できない" do
        @user.kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana mei can't be blank")
      end
      it 'birthday が空だと無効' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
    end
  end
end
