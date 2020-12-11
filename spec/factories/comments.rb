FactoryBot.define do
  factory :comment do
    comment             {Faker::Lorem.sentence}
    association :user
    association :profile
    association :board
    
  end
end
