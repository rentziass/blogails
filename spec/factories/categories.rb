FactoryGirl.define do
  factory :category do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end

end
