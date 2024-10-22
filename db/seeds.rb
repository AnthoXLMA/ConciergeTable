# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Deleting Categories"
Category.delete_all
puts "Deleting Guests"
Guest.delete_all
puts "Deleting Users"
User.delete_all
puts "Deleting Restaurant"
Restaurant.delete_all

puts 'Creating Restaurants...'
# @restaurantspath = './db/fixtures/restaurants.json'
# @serialized_restaurants = File.read(@restaurantspath)
# @restaurants = JSON.parse(@serialized_restaurants)
@all_restaurants = []
500.times do

    @all_restaurants << Restaurant.create(
      rest_name:    Faker::Company.name,
      city: "#{Faker::Address.city}"
    )
end


puts 'Creating Users...'
# @restaurantspath = './db/fixtures/restaurants.json'
# @serialized_restaurants = File.read(@restaurantspath)
# @restaurants = JSON.parse(@serialized_restaurants)
@all_users = []
100.times do

    @all_users << User.create(
      first_name:    Faker::Name.name
    )
end


puts 'Creating Guests...'
# @restaurantspath = './db/fixtures/restaurants.json'
# @serialized_restaurants = File.read(@restaurantspath)
# @restaurants = JSON.parse(@serialized_restaurants)
@all_guests = []
100.times do

    @all_guests << Guest.create(
      last_name:    Faker::Name.name,
      first_name:    Faker::Name.name
    )
end


puts 'Creating Categories...'
@categoriespath = './db/fixtures/categories.json'
@serialized_categories = File.read(@categoriespath)
@categories = JSON.parse(@serialized_categories)
@all_categories = []
    @categories.each do |row|
    @all_categories << Category.create!(title: row['title'])
end
