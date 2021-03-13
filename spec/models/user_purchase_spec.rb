require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user.id)
      # @item.image = fixture_file_upload('spec/fixtures/ルンパッパ.png')
      @user_purchase = FactoryBot.build(:user_purchase, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    describe '商品購入者の情報登録' do
      # 正常系テスト
      context '商品購入者の情報登録が出来る場合' do
        it '全ての値が正しいと登録ができる' do
          @user_purchase.valid?
          expect(@user_purchase).to be_valid
        end
      end

      # 異常系テスト
      context '商品購入者の情報登録が出来ない場合' do
        it '郵便番号が空だと登録できない' do
          @user_purchase.post_code = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Post code can't be blank"
        end
        it '郵便番号にーが含まれていないと登録できない' do
          @user_purchase.post_code = '1111111'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Post code input correctly. And also need hyphen(-)."
        end
        it '郵便番号に半角文字が含まれていないと登録できない' do
          @user_purchase.post_code = 'a111111'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Post code input correctly. And also need hyphen(-)."
        end
        it '郵便番号に全角文字が含まれていないと登録できない' do
          @user_purchase.post_code = 'あ111111'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Post code input correctly. And also need hyphen(-)."
        end
        it '都道府県が空だと登録できない' do
          @user_purchase.area_id = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Area can't be blank"
        end
        it '都道府県で---を選択すると登録できない' do
          @user_purchase.area_id = 1
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Area Select"
        end
        it '市区町村が空だと登録できない' do
          @user_purchase.city = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "City can't be blank"
        end
        it '番地は空だと登録できない' do
          @user_purchase.address = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Address can't be blank"
        end
        it '電話番号は空だと登録できない' do
          @user_purchase.phone_number = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Phone number can't be blank"
        end
        it '電話番号は12桁以上だと登録できない' do
          @user_purchase.phone_number = '090123456789'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Phone number input only number.  And also within 11 digits."
        end
        it '電話番号に半角文字が含まれていると登録できない' do
          @user_purchase.phone_number = 'A0901234567'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Phone number input only number.  And also within 11 digits."
        end
        it '電話番号に全角文字が含まれていると登録できない' do
          @user_purchase.phone_number = 'あ0901234567'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Phone number input only number.  And also within 11 digits."
        end
        it 'user_id(商品購入者)が紐付いてないと登録できない' do
          @user_purchase.user_id = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "User can't be blank"
        end
        it 'item_id(出品されている商品)が紐付いてないと登録できない' do
          @user_purchase.item_id = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Item can't be blank"
        end
        it 'tokenが空だと登録できない' do
          @user_purchase.token = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Token can't be blank"
        end
      end

    end

end

