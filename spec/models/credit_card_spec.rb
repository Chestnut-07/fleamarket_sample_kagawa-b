require 'rails_helper'
describe CreditCard do
  describe '#create' do
    
    it "is valid with all columun" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end

    it "is invalid without a user" do
      credit_card = build(:credit_card, user: nil)
      credit_card.valid?
      expect(credit_card).to be_invalid
    end

    it "is invalid without a customer_token" do
      credit_card = build(:credit_card, customer_token: nil)
      credit_card.valid?
      expect(credit_card).to be_invalid
    end

    it "is invalid without a card_token" do
      credit_card = build(:credit_card, card_token: nil)
      credit_card.valid?
      expect(credit_card).to be_invalid
    end

  end
end

