FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number:8) }
    body { Faker::Lorem.characters(number:30) }
  end
end