FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"あああ"}
    first_name            {"あああ"}
    family_name_kana      {"アアア"}
    first_name_kana       {"アアア"}
    birth_date            {"1991-01-01"}
  end

end