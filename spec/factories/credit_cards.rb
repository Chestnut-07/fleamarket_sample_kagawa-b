FactoryBot.define do
  factory :credit_card do
    user              {FactoryBot.create(:user)}
    customer_token    {"aaaaaaaaa"}
    card_token        {"aaaaaaaaa"}
  end
end