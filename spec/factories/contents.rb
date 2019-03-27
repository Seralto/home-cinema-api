FactoryBot.define do
  factory :content do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.paragraph }
    type { %w(Movie Season).sample }

    factory :invalid_content do
      title { nil }
    end

    factory :invalid_content_type do
      type { nil }
    end

    factory :movie, class: 'Movie' do
      type { 'Movie' }
    end

    factory :season, class: 'Season' do
      type { 'Season' }
    end
  end
end
