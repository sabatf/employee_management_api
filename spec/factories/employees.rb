
FactoryBot.define do
  factory :employee do
    name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
    role { Faker::Lorem.word }
    email { Faker::Internet.email }
    address { Faker::Address.street_address }
    status { Faker::Number.number(digits: 1) }
  end
end
