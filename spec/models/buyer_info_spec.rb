require 'rails_helper'

RSpec.describe BuyerInfo, type: :model do
  describe '購入者の情報登録' do
    before do
      @buyer_info = FactoryBot.build(:buyer_info)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_info).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @buyer_info.token = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_numが空だと保存できない' do
      @buyer_info.postal_num = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Postal num can't be blank")
    end
    it 'postal_numについて、-がないと保存できないこと' do
      @buyer_info.postal_num = '1234567'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include('Postal num is invalid. Include hyphen(-)')
    end
    it 'postal_numについて、3文字-4文字の形でないと保存できないこと' do
      @buyer_info.postal_num = '12-12233'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include('Postal num is invalid. Include hyphen(-)')
    end
    it 'pref_idが空だと保存できないこと' do
      @buyer_info.pref_id = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include('Pref Select')
    end
    it 'pref_idが1だと保存できないこと' do
      @buyer_info.pref_id = 1
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include('Pref Select')
    end
    it 'cityが空だと保存できないこと' do
      @buyer_info.city = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numが空だと保存できないこと' do
      @buyer_info.house_num = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("House num can't be blank")
    end
    it 'buildingが空でも保存できること' do
      @buyer_info.building = ''
      expect(@buyer_info).to be_valid
    end
    it 'tel_numが空だと保存できないこと' do
      @buyer_info.tel_num = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Tel num can't be blank")
    end
    it 'tel_numが数字以外だと保存できないこと' do
      @buyer_info.tel_num = '03-0000-000'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include('Tel num is number')
    end
  end
end
