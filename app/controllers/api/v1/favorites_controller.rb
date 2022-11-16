class Api::V1::FavoritesController < ApplicationController
 def create
   @user = User.find_by(api_key: params[:api_key])

  if @user != nil
   favorite = Favorite.new({ user_id: @user.id, 
    country: params[:favorite][:country],
    recipe_link: params[:favorite][:recipe_link],
    recipe_title: params[:favorite][:recipe_title] })

   render json: { success: 'Favorite added successfully' }, status: :created
  else
   render json: { error: 'Favorite unsuccessfully created' }, status: :bad_request
  end
 end

 def index
  @user = User.find_by(api_key: params[:api_key])
  
  render json: FavoriteSerializer.new(@user.favorites)
 end
end