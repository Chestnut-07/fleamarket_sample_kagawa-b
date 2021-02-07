class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :post_code,                presence: true
  validates :prefecture_id,            presence: true
  validates :city,                     presence: true
  validates :house_number,             presence: true
          
           
end
