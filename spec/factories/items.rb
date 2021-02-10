FactoryBot.define do
  factory :item do
    name {Faker::Game.title}
    price {Faker::Number.number(digits: 7)}
    trading_status {1}
    introduction {Faker::Lorem.words}
    condition_id {1}
    shipping_fee_payer_id {1}
    prefecture_id {1}
    preparation_day_id {1}
    seller {FactoryBot.create(:user)}
    buyer {FactoryBot.create(:user)}
    category {FactoryBot.create(:category)}
    after(:build) do |built_item|
      built_item.item_image = FactoryBot.build(:item_image, item:built_item)
    end
  end

  factory :item_image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.jpg'), 'spec/factories/test_image.jpg')}
  end  

end