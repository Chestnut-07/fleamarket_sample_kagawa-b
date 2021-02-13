require 'rails_helper'
describe CreditCard do
  describe '#create' do
    
    it "is valid with all columun" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end

  end
end

