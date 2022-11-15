class RecipeSerializer
  include JSONAPI::Serializer
  attributes :country, :recipe_link, :recipe_title
end