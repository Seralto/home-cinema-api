FactoryBot.define do
  factory :content do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.paragraph }
    type { %w(Movie Season).sample }
  end

  factory :invalid_content, class: 'Content' do
    title { nil }
  end

  factory :invalid_content_type, class: 'Content' do
    type { nil }
  end

  factory :movie, parent: :content, class: 'Movie' do
    type { 'Movie' }
  end

  factory :season, parent: :content, class: 'Season' do
    type { 'Season' }
  end
end
