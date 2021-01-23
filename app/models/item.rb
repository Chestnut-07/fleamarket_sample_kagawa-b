class Item < ApplicationRecord
  belongs_to :user
  has_one :item_image, dependent: :destroy
  belongs_to :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
end
