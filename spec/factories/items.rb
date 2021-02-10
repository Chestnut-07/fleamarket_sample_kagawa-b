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
  end


end