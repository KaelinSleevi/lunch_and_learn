class Api::V1::UsersController < ApplicationController
 def create
   user = User.create({ 
    name: params[:user][:name], 
    email: params[:user][:email], 
    api_key: SecureRandom.hex(15)
    })

   render json: UserSerializer.new(user), status: :created
 end
end