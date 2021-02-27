require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # 正常系テスト
    it '全ての値が正しいと登録ができる' do
      @user.valid?
      expect(@user).to be_valid
    end

    # 異常系テスト
    it 'ニックネームは空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスに＠が含まれてないと登録できない' do
      @user.email = 'testcom'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it '重複したメールアドレスは登録できない' do
      @user.email = 'test@com'
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = 'test@com'
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは英語のみでは登録できない' do
      @user.password = 'UUUUUU'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
    end
    it 'パスワードは数字のみでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
    end
    it 'パスワードは全角では登録できない' do
      @user.password = 'ＡＡＡ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
    end
    it 'パスワードが５文字以下だと登録できない' do
      @user.password = 'UUU88'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードとパスワード（確認用）の値が一致しないと登録できない' do
      @user.password = 'UUU888'
      @user.password_confirmation = 'UUU887'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '苗字は空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname can't be blank"
    end
    it '名前は空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
    end
    it '苗字（カナ）は空では登録できない' do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
    end
    it '名前（カナ）は空では登録できない' do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
    end
    it '苗字は漢字・平仮名・カタカナ以外では登録できない' do
      @user.lastname = 'AA'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Lastname Full-width characters'
    end
    it '名前は漢字・平仮名・カタカナ以外では登録できない' do
      @user.firstname = 'AA'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Firstname Full-width characters'
    end
    it '苗字（カナ）は全角カタカナ以外では登録できない' do
      @user.lastname_kana = 'AA'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Lastname kana Full-width katakana characters'
    end
    it '名前（カナ）は全角カタカナ以外では登録できない' do
      @user.firstname_kana = 'AA'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Firstname kana Full-width katakana characters'
    end
    it '苗字（カナ）はカタカナ以外の全角文字では登録できない' do
      @user.lastname_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Lastname kana Full-width katakana characters'
    end
    it '名前（カナ）はカタカナ以外の全角文字では登録できない' do
      @user.firstname_kana = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Firstname kana Full-width katakana characters'
    end
    it '生年月日は空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
