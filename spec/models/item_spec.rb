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

    end
  end
end