class CreditCard < ApplicationRecord
  belongs_to :user, optional: true

  validates :customer_token, presence: true
  validates :card_token, presence: true
end
