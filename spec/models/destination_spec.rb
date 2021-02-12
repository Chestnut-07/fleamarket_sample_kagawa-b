require 'rails_helper'
describe Destination do
  describe '#create' do

    it "is valid with all columun" do
      destination = build(:destination)
      expect(destination).to be_valid
    end

    it "is invalid without a post_code" do
      destination = build(:destination, post_code: nil)
      destination.valid?
      expect(destination.errors[:post_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      destination = build(:destination, prefecture_id: nil)
      destination.valid?
      expect(destination.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      destination = build(:destination, city: nil)
      destination.valid?
      expect(destination.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a house_number" do
      destination = build(:destination, house_number: nil)
      destination.valid?
      expect(destination.errors[:house_number]).to include("を入力してください")
    end


  end
end

