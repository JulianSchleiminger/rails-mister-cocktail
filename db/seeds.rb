require 'open-uri'
require 'json'
Ingredient.destroy_all

data = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
parsed = JSON.parse(data)

puts "Creating Ingredients"
parsed['drinks'].each do |ingr|
  Ingredient.create(name: ingr['strIngredient1'])
end
puts "Finished creating Ingredients"
