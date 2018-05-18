# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'open-uri'

# Ingredient.destroy_all if Rails.env.development?

# puts "Creating..."

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# drinks_serialized = open(url).read
# drinks = JSON.parse(drinks_serialized) #hash
# drinks.each do |drink|
# ingredient = Ingredient.create(name: drink["strIngredient1"])# "light rum"=ingredient.cocktail
# ingredient.cocktail
# ingredient.doses
# end

require "open-uri"
require "json"

puts 'Cleaning database...'
Ingredient.destroy_all if Rails.env.development?
ingredients = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
ingredients["drinks"].each do |drink|
  i = Ingredient.create(name: drink['strIngredient1'])
  puts "Created #{i.name}"
end



# hash (1 key, 1 value)
# 1 key name "drinks"
# 1 key value is an array

# access each value (array)
