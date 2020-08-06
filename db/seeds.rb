# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'John', email: 'admin@tnklst.com', role: 'admin', password: '123456')
User.create!(name: 'Adi', email: 'curation@tnklst.com', role: 'curation', password: '123456')
User.create!(name: 'Jen', email: 'visitortnklst.com', role: 'visitor', password: '123456')

10.times do |i|
  Product.create!(
    name: Faker::Commerce.product_name,
    brand: ['Zara', 'Uniqlo', 'H&M', 'Gucci'].sample,
    category: Product.categories.values.sample,
    colour: Faker::Color.color_name,
    condition: Product.conditions.values.sample,
    price: Faker::Number.decimal(l_digits: 6, r_digits: 2),
    quantity: Faker::Number.number(digits: 2)
  )
end
