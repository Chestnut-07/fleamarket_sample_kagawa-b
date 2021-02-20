class CreditCard < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :user
    validates :customer_token
    validates :card_token
  end
end
