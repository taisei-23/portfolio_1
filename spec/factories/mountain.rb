FactoryBot.define do
  factory :mountain do
    name { "たんばらスキーパーク" }
    latitude { 36.1 }
    longitude { 138.9 }
    place_id { "dummy_place_id" }
    address { "群馬県" }
    rating { 4.5 }
    user_ratings_total { 100 }
  end
end
