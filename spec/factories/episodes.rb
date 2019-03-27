FactoryBot.define do
  factory :episode do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.paragraph }
    sequence(:number)
    season

    factory :invalid_episode do
      title { nil }
    end

    factory :invalid_episode_season do
      season { nil }
    end
  end
end
