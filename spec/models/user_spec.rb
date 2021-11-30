require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
  end

  context 'ユーザー情報の入力内容に問題がない場合' do
    it 'すべての項目が正しく入力されていればユーザー登録できる' do
      expect(@user1).to be_valid
    end
  end
  context 'ユーザー情報の入力内容に問題がある場合' do
    it 'nicknameがカラではユーザー登録できない' do
      @user1.nickname = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailがカラではユーザー登録できない' do
      @user1.email = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Email can't be blank")
    end
    it '既に登録されているemailではユーザー登録できない' do
      @user1.save
      @user2.email = @user1.email
      @user2.valid?
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていなければユーザー登録できない' do
      @user1.email = 'test.test.com'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordがカラではユーザー登録できない' do
      @user1.password = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下ではではユーザー登録できない' do
      @user1.password = '1111a'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字の２種類を含んでいなければユーザー登録できない' do
      @user1.password = 'あああああ1'
      @user1.password_confirmation = 'あああああ1'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      @user2.password = 'あああああa'
      @user2.password_confirmation = 'あああああa'
      @user2.valid?
      expect(@user1.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'passwordとpassword_confirmationが一致しなければユーザー登録できない' do
      @user1.password_confirmation = '11111a'
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameがカラではユーザー登録できない' do
      @user1.last_name = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角日本語だけで構成されていなければユーザー登録できない' do
      @user1.last_name = 'あいueo1'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('Last name is invalid. Input full-width characters')
    end
    it 'first_nameがカラではユーザー登録できない' do
      @user1.first_name = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角日本語だけで構成されていなければユーザー登録できない' do
      @user1.first_name = 'あいueo1'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('First name is invalid. Input full-width characters')
    end
    it 'last_name_kanaがカラではユーザー登録できない' do
      @user1.last_name_kana = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが全角カタカナだけで構成されていなければユーザー登録できない' do
      @user1.last_name_kana = 'てすとダ'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
    end
    it 'first_name_kanaがカラではユーザー登録できない' do
      @user1.first_name_kana = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが全角カタカナだけで構成されていなければユーザー登録できない' do
      @user1.first_name_kana = 'てすタロウ'
      @user1.valid?
      expect(@user1.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
    end
    it 'birthdayがカラではユーザー登録できない' do
      @user1.birthday = ''
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'birthdayに一つでもカラの項目があればユーザー登録できない' do
      @user1.birthday = '2000-01---'
      @user1.valid?
      expect(@user1.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
