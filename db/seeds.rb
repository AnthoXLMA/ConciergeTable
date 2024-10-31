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

puts 'Creating Categories...'
@categoriespath = './db/fixtures/categories.json'
@serialized_categories = File.read(@categoriespath)
@categories = JSON.parse(@serialized_categories)
@all_categories = []
    @categories.each do |row|
    @all_categories << Category.create!(title: row['title'])
end

puts 'Creating Hotels...'
@hotelspath = './db/fixtures/hotels.json'
@serialized_hotels = File.read(@hotelspath)
@hotels = JSON.parse(@serialized_hotels)
@all_hotels = []
    @hotels.each do |row|
    @all_hotels << Hotel.create!(hotel_name: row['hotel_name'],
      location: row['location'],
      description: row['description']
      )
end

puts 'Creating Guests...'
# @restaurantspath = './db/fixtures/restaurants.json'
# @serialized_restaurants = File.read(@restaurantspath)
# @restaurants = JSON.parse(@serialized_restaurants)
@guestspath = './db/fixtures/guests.json'
@serialized_guests = File.read(@guestspath)
@guests = JSON.parse(@serialized_guests)
@all_guests = []
  @guests.each do |row|
  @all_guests << Guest.create!(
    last_name: row['last_name'],
    first_name: row['first_name'],
    hotel_id: row['hotel_id'],
    date_d_arrivee: row['date_d_arrivee']
  )
end

# puts 'Creating Tasks...'
# @taskspath = './db/fixtures/tasks.json'
# @serialized_tasks = File.read(@taskspath)
# @tasks = JSON.parse(@serialized_tasks)
# @all_tasks = []
#     @tasks.each do |row|
#     @all_tasks << Task.create!(nom: row['nom'],
#       date_de_demande: row['date_de_demande'],
#       date_d_echeance: row['date_d_echeance'],
#       category: row['category'],
#       nom_du_client: row['nom_du_client'],
#       description: row['description'],
#       guest_id: row['guest_id']
#     )
# end

puts 'Creating Destinations...'
@destinationspath = './db/fixtures/destinations.json'
@serialized_destinations = File.read(@destinationspath)
@destinations = JSON.parse(@serialized_destinations)
@all_destinations = []
    @destinations.each do |row|
    @all_destinations << Destination.create!(site: row['site'], description: row['description'])
end
