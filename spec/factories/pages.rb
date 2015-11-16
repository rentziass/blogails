FactoryGirl.define do
  factory :page do
    title { Faker::Lorem.word }
    text { Faker::Lorem.paragraph }
    visible true
    position { Faker::Number.between(1, 10) }
  end

end
