FactoryBot.define do
  factory :profile do
    nickname                {Faker::Name.name}
    age                     {25}
    birthday                {Faker::Date.backward}
    area_id                 {2}
    genre_one_id            {2}
    genre_two_id            {2}
    genre_three_id          {2}
    history                 {8}
    public_relation         {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
