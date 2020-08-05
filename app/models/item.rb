class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :ship_origin
  belongs_to_active_hash :ship_date

  
  has_one :deal, class_name: "Transaction"
  belongs_to :user
  has_one :address

  
end
