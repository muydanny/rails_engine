# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# 10.times do
#   Merchant.create!(
#     name: Faker::Commerce.name
#   )
# end

# 10.times do
#   Item.create!(
#     name: Faker::Commerce.name,
#     description: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote,
#   )
# end

# 10.times do
#   Transactions.create!(invoice_number: rand(100000..999999))
# end

# 10.times do
#   Invoice.create!(invoice_number: rand(100000..999999))
# end

# 100.times do
#   InvoiceItem.create!(
#     item_id: rand(1..10),
#     invoice_id: rand(1..10),
#     unit_price: rand(100..10000),
#     quantity: rand(1..10)
#   )
# end