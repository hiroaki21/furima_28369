FactoryBot.define do
  factory :buyer_info do
    token       { 'ajfaoldk' }
    postal_num  { '150-0000' }
    pref_id     { 21 }
    city        { '渋谷区' }
    house_num   { '一丁目' }
    building    { '東京ハイツ' }
    tel_num     { '09000000000' }
  end
end
