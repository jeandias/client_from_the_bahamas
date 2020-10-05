FactoryBot.define do
  factory :client do
    fiscal_id { Faker::Number.number(digits: 9) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
