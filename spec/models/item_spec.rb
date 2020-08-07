require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'titleが空では保存できないこと' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'introduceが空では保存できないこと' do
      @item.introduce = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduce can't be blank")
    end

    it 'カテゴリが1では保存できないこと' do
      @item.category_id = 1
      @item.status_id = 1
      @item.fee_burden_id = 1
      @item.ship_origin_id = 1
      @item.ship_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select',
                                                    'Status Select',
                                                    'Fee burden Select',
                                                    'Ship origin Select',
                                                    'Ship date Select')
    end

    it 'カテゴリが空では保存できないこと' do
      @item.category_id = nil
      @item.status_id = nil
      @item.fee_burden_id = nil
      @item.ship_origin_id = nil
      @item.ship_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select',
                                                    'Status Select',
                                                    'Fee burden Select',
                                                    'Ship origin Select',
                                                    'Ship date Select')
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300以下では保存できないこと' do
      @item.price = 288
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999より大きくては保存できないこと' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが数字以外では保存できないこと' do
      @item.price = '7.f'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
