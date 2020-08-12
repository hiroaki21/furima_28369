class BuyerInfo
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_num, :pref_id, :city, :house_num, :building, :tel_num, :token

  with_options presence: true do
    validates :token
    validates :postal_num,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :pref_id,       numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_num
    validates :tel_num,        numericality: { only_integer: true, message: 'is number' }
  end

  def save
    Address.create(postal_num: postal_num, pref_id: pref_id, city: city, house_num: house_num, building: building, tel_num: tel_num, item_id: item_id)
    Transaction.create(user_id: user_id, item_id: item_id)
  end
end
