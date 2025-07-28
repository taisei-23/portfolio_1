FactoryBot.define do
  factory :post do
    title { "Test Post" }
    body { "This is a test post." }
    association :user
  end
end
