class Item < ApplicationRecord
  # belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_one :item_image, dependent: :destroy
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
end
