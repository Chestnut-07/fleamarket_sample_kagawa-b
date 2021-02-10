require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it "is valid with all" do
        expect(build(:item)).to be_valid
      end

    end
  end
end