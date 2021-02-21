FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password} 
    family_name           {"あああ"}
    first_name            {"あああ"}
    family_name_kana      {"アアア"}
    first_name_kana       {"アアア"}
    birth_date            {"1991-01-01"}
  end

end
