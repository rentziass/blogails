FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.word }
    text { Faker::Lorem.paragraph }
    evidence false
    visible true
    # TODO: date sta per?
    date { Faker::Time.forward(2, :morning) }
    commentable true
    # TODO: qui facciamo lo stesso che nell'altro progetto?
    tag { Faker::Name.title }
    summary { Faker::Lorem.paragraph }
    # TODO: per me: cos'e?
    name { Faker::Name.title }
    # TODO: per me: cos'e?
    draft { Faker::Number.between(1, 10) }
  end
end
