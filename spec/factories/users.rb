FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    first_name {Faker::Name.first_name}
    family_name {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    family_name_kana {Faker::Name.last_name}
    birth_date {Faker::Date.birthday(min_age: 18, max_age: 65)}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password} 
  end
end