5.times do
  movie = Movie.create(title: Faker::Book.title, plot: Faker::Quote.matz)
  PurchaseOption.create(price: Faker::Number.decimal(1, 2), quality: 'HD', content: movie)
  PurchaseOption.create(price: Faker::Number.decimal(1, 2), quality: 'SD', content: movie)
end

2.times do
  season = Season.create(title: Faker::Book.title, plot: Faker::Quote.matz)
  PurchaseOption.create(price: Faker::Number.decimal(1, 2), quality: 'HD', content: season)
  PurchaseOption.create(price: Faker::Number.decimal(1, 2), quality: 'SD', content: season)

  10.times { |i| season.episodes.create(title: Faker::Book.title, plot: Faker::Quote.famous_last_words, number: i + 1) }
end

user = User.create(email: Faker::Internet.email)

Purchase.create(user: user, purchase_option: PurchaseOption.first)
Purchase.create(user: user, purchase_option: PurchaseOption.last)
