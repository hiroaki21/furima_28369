class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee_burden
  belongs_to_active_hash :ship_origin
  belongs_to_active_hash :ship_date

  has_one :deal, class_name: 'Transaction'
  belongs_to :user
  has_one :address
  has_one_attached :image

  validate :image_presence
  with_options presence: true do
    validates :title
    validates :introduce
    validates :category_id,    numericality: { other_than: 1, message: 'Select' }
    validates :status_id,      numericality: { other_than: 1, message: 'Select' }
    validates :fee_burden_id,  numericality: { other_than: 1, message: 'Select' }
    validates :ship_origin_id, numericality: { other_than: 1, message: 'Select' }
    validates :ship_date_id,   numericality: { other_than: 1, message: 'Select' }
  end

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  validates :price, presence: true, numericality:
  { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
