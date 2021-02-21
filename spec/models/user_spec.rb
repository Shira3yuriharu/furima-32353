require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスに＠が含まれてないと登録できない' do
      user = User.new(nickname: 'test', email: 'testcom', password: 'UUU888', password_confirmation: 'UUU888', lastname: '山田',
                      firstname: '太郎', lastname_kana: 'ヤマダ', firstname_kana: 'タロウ', birthday: '2018-02-26')
      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include 'Email is invalid'
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが５文字以下だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@com', password: 'UUU88', password_confirmation: 'UUU88', lastname: '山田',
                      firstname: '太郎', lastname_kana: 'ヤマダ', firstname_kana: 'タロウ', birthday: '2018-02-26')
      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードとパスワード（確認用）の値が一致しないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@com', password: 'UUU888', password_confirmation: 'UUU887', lastname: '山田',
                      firstname: '太郎', lastname_kana: 'ヤマダ', firstname_kana: 'タロウ', birthday: '2018-02-26')
      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
