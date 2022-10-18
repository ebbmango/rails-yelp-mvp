# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

AMOUNT = 10

puts "Creating #{AMOUNT} restaurants..."

AMOUNT.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample
  )
  restaurant.save!
  puts "created #{restaurant.category} restaurant '#{restaurant.name}' at id #{restaurant.id}"

  5.times do
    review = Review.new(
      content: Faker::Lorem.sentence(word_count: 15),
      rating: (0..5).to_a.sample,
      restaurant_id: restaurant.id
    )
    review.save!
  end
end

puts 'Done!'
