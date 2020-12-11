FactoryBot.define do
  factory :board do
    name                  {Faker::Lorem.sentence}
    genre_one_id          {2}
    explanation           {Faker::Lorem.sentence}
    association :user
    association :profile
  end
end
