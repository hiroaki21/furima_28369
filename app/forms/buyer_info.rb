class BuyerInfo
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_num,:pref_id,:city,:house_num,:building,:tel_num

  with_options presence: true do
    validates :postal_num
    validates :pref_id
    validates :city
    validates :house_num
    validates :tel_num
  end

  def save
    Address.create(postal_num: postal_num,pref_id: pref_id,city: city,house_num: house_num,building: building,tel_num: tel_num,item_id: item_id)
    Transaction.create(user_id: user_id,item_id:item_id)
  end
end