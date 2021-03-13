require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
      @item.image = fixture_file_upload('spec/fixtures/ルンパッパ.png')
      @user_purchase = FactoryBot.build(:user_purchase, item_id: @item.id)
    end

    describe '商品購入者の情報登録' do
      # 正常系テスト
      context '商品購入者の情報登録が出来る場合' do
        it '全ての値が正しいと登録ができる' do
          @user_purchase.valid?
          expect(@user_purchase).to be_valid
        end
      end

    end

  end

