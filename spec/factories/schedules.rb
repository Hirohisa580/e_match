FactoryBot.define do
  factory :schedule do
    title                   {Faker::Lorem.sentence}
    plan                    {Faker::Lorem.sentence}
    start_time              {"2020-12-16 16:00:00"}
    association :user
    association :profile
  end
end
