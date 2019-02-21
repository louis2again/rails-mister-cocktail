# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts 'Mixing your drinks...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# open url we want to extract information from
information = open(url).read
# parse information and check in consile what the info looks like
# this information is a hash
ingredients = JSON.parse(information)
# extract information by iterating over the hash key which is "drinks" in this
# case
ingredients["drinks"].each do |ingredient|
  # then inside the hash look at the key so we can get the value of the ingredient
  # name
  # create the ingredient for the database using following syntax
  Ingredient.create(name: ingredient["strIngredient1"])
end

Cocktail.create(name: "Gin Tonic")
Cocktail.create(name: "Pina colada")
Cocktail.create(name: "Whisky Sour")
Cocktail.create(name: "Cherry Liquer")

Cocktail.all.each do |cocktail|
Dose.create(description: "2cl", ingredient: Ingredient.first, cocktail: cocktail)
end
puts 'Voila Finished! - Remember dont drink and drive...'
