FactoryBot.define do
  factory :credit_card do
    user              {1}
    customer_token    {"aaaaaaaaa"}
    card_token        {"aaaaaaaaa"}
  end
end