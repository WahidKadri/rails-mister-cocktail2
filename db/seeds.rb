require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
parsed_ingredients = JSON.parse(ingredients_serialized)
ingredients_array = parsed_ingredients["drinks"]
ingredients_array.each do |hash_ingredient|
  ingredient = hash_ingredient["strIngredient1"]
  Ingredient.create(name: ingredient)
end
