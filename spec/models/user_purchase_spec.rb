require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user.id)
      # @item.image = fixture_file_upload('spec/fixtures/ルンパッパ.png')
      @user_purchase = FactoryBot.build(:user_purchase, user_id: @user.id, item_id: @item.id)
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
        end
        it '郵便番号にーが含まれていないと登録できない' do
        end
        it '都道府県が空だと登録できない' do
        end
        it '都道府県で---を選択すると登録できない' do
        end
        it '市区町村が空だと登録できない' do
        end
        it '市区町村は半角英数字を登録できない' do
        end
        it '番地は空だと登録できない' do
        end
        it '電話番号は空だと登録できない' do
        end
        it '電話番号は12桁以上だと登録できない' do
        end
        it '電話番号に半角文字が含まれていると登録できない' do
        end
        it '電話番号に全角文字が含まれていると登録できない' do
        end
        it 'user_id(商品購入者)が紐付いてないと登録できない' do
        end
        it 'item_id(出品されている商品)が紐付いてないと登録できない' do
        end
        it 'tokenが空だと登録できない' do
        end
      end

    end

end

