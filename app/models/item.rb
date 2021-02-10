class Item < ApplicationRecord
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_one :item_image, dependent: :destroy
  accepts_nested_attributes_for :item_image, allow_destroy: true
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :seller_id
    validates :item_image
  end
end
