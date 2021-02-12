class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_number
  end
           
end
