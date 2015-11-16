FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.word }
    text { Faker::Lorem.paragraph }
    evidence false
    visible true
    date { Faker::Time.forward(2, :morning) }
    commentable true
    tag { Faker::Name.title }
    summary { Faker::Lorem.paragraph }
  end
end
