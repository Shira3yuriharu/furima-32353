require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end

  describe '商品新規登録' do
    # 正常系テスト
    context '商品新規登録ができる場合' do
      it '全ての値が正しいと登録ができる' do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    # 異常系テスト
    context '商品新規登録ができない場合' do
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名は空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品名は41文字以上だと登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end
      it '商品の説明が空だと登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it '商品の説明は1001文字以上だと登録できない' do
        @item.explain = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Explain is too long (maximum is 1000 characters)'
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'カテゴリーidが---空だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it '商品の状態が空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status of Sales Select'
      end
      it '商品の状態が---だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status of Sales Select'
      end
      it '配送料の負担が空だと登録できない' do
        @item.method_of_payment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Method of payment Select'
      end
      it '配送料の負担が---だと登録できない' do
        @item.method_of_payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Method of payment Select'
      end
      it '発送元の地域が空だと登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area Select'
      end
      it '発送元の地域が---だと登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area Select'
      end
      it '発送までの日数が空だと登録できない' do
        @item.day_required_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day required Select'
      end
      it '発送までの日数が---だと登録できない' do
        @item.day_required_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day required Select'
      end
      it '販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '299以下の販売価格は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it '10,000,000以上の販売価格は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it '全角数字の販売価格は登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it '英数字混合では販売価格を登録できない' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
    end
  end
end
