class EdamamFacade

 def self.recipe_details
  recipe_data = EdamamService.recipe_search
  @recipes = recipe_data.map do |data|
   Recipe.new(data)
  end
 end
end