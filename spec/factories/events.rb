FactoryGirl.define do
  factory :event do
    name {Faker::Music.instrument}
    date_start {Faker::Date.forward(200)}
  end
end
