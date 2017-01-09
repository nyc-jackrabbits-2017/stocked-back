# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               password: "password")
end

stock_purchases = [{stock_symbol: "ARIA", purchase_price: 23.71, quantity: rand(1..1000)},
                  {stock_symbol: "FB", purchase_price: 124.82, quantity: rand(1..1000)},
                  {stock_symbol: "CBIS", purchase_price: 0.06, quantity: rand(1..1000)},
                  {stock_symbol: "CBDS", purchase_price: 6.44, quantity: rand(1..1000)},
                  {stock_symbol: "AAPL", purchase_price: 117.02, quantity: rand(1..1000)}
                  ]

User.all.each do |user|
  stocks = stock_purchases.sample(3)
  stocks.each do |stock|
    user.purchased_stocks.create!(stock)
  end
end
