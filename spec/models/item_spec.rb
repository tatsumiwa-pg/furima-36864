require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品情報の入力内容に問題がない場合' do
    it 'すべての項目が正しく入力されていれば商品登録ができる' do
      expect(@item).to be_valid
    end
  end

  context '商品情報の入力内容に問題がある場合' do
    it 'items_nameがカラでは商品登録ができない' do
      @item.items_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Items name can't be blank")
    end
    it 'items_infoがカラでは商品登録ができない' do
      @item.items_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Items info can't be blank")
    end
    it 'category_idが0では商品登録ができない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'items_status_idが0では商品登録ができない' do
      @item.items_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Items status can't be blank")
    end
    it 'shipping_fee_idが0では商品登録ができない' do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it 'prefecture_idが0では商品登録ができない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'shipping_date_idが0では商品登録ができない' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it 'item_priceがカラでは商品登録ができない' do
      @item.items_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Items price can't be blank")
    end
    it 'item_priceが300未満では商品登録ができない' do
      @item.items_price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Items price is invalid. Input half-width numbers (between 300 ~ 9,999,999)')
    end
    it 'item_priceが9999999を超過していたら商品登録ができない' do
      @item.items_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Items price is invalid. Input half-width numbers (between 300 ~ 9,999,999)')
    end
    it 'item_priceに半角数字以外が含まれている場合は商品登録ができない' do
      @item.items_price = '123４5'
      @item.valid?
      expect(@item.errors.full_messages).to include('Items price is invalid. Input half-width numbers (between 300 ~ 9,999,999)')
    end
    it 'imageがカラでは商品登録ができない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'userが存在しなければ商品登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
