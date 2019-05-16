# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'json'
# require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

Ingredient.delete_all

data_drinks = JSON.parse(open(url).read)

ingredients_array = data_drinks["drinks"]

ingredients_array.each do |ingredient|
  new_ingredient = ingredient["strIngredient1"]
  Ingredient.create(name: new_ingredient)
end

Cocktail.delete_all

25.times do
  new_name = Faker::Food.unique.fruits
  Cocktail.create(name: new_name)
end

Dose.delete_all

25.times do
  ingredient = Ingredient.find(rand(1761..1921))
  new_cocktail = Cocktail.find(rand(251..271))
  Dose.create!(ingredient_id: ingredient.id, cocktail_id: new_cocktail.id, description: "X cl")
end
