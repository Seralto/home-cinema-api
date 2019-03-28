5.times do
  Movie.create(title: Faker::Book.title, plot: Faker::Quote.matz)
end

2.times do
  season = Season.create(title: Faker::Book.title, plot: Faker::Quote.matz)
  10.times { |i| season.episodes.create(title: Faker::Book.title, plot: Faker::Quote.famous_last_words, number: i + 1) }
end
