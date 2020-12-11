FactoryBot.define do
  factory :message do
    message             {Faker::Lorem.sentence}
    association :dm
    association :user
    association :profile
    
  end
end
