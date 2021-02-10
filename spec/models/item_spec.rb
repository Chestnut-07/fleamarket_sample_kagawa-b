require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it "is valid with all" do
        expect(build(:item)).to be_valid
      end

      it "is valid without a buyer" do
        expect(build(:item, buyer: nil)).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid with a name length 40 over" do
        expect(build(:item, name: "a" * 41)).to be_invalid
      end

      it "is invalid with a introduction 1000 over" do
        expect(build(:item, introduction: "a" * 1001)).to be_invalid
      end

      it "is invalid with a price 300 under" do
        expect(build(:item, price: 299)).to be_invalid
      end

      it "is invalid with a price 9999999 over" do
        expect(build(:item, price: 10000000)).to be_invalid
      end

      it "is invalid without a name" do
        expect(build(:item, name: nil)).to be_invalid
      end

      it "is invalid without a price" do
        expect(build(:item, price: nil)).to be_invalid
      end

      it "is invalid without a trading_status" do
        expect(build(:item, trading_status: nil)).to be_invalid
      end

      it "is invalid without a introduction" do
        expect(build(:item, introduction: nil)).to be_invalid
      end

      it "is invalid without a condition_id" do
        expect(build(:item, condition_id: nil)).to be_invalid
      end

      it "is invalid without a shipping_fee_payer_id" do
        expect(build(:item, shipping_fee_payer_id: nil)).to be_invalid
      end

    end
  end
end