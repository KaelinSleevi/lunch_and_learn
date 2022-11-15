class Api::V1::FavoritesController < ApplicationController
 def create
   @user = User.find_by(api_key: params[:api_key])
 
   favorite = Favorite.new({ user_id: @user.id, 
    country: params[:favorite][:country],
    recipe_link: params[:favorite][:recipe_link],
    recipe_title: params[:favorite][:recipe_title] })

  if favorite.save
   render json: { success: 'Favorite added successfully' }, status: :created
  else
   render json: { error: 'favorite unsuccessfully created' }
  end
 end
end