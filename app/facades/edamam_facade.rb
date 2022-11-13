class EdamamFacade

 def self.recipe_details(country)
  recipe_data = EdamamService.recipe_search(country)
  recipes = recipe_data.map do |data|
   Recipe.new(data, country)
  end
 end
end