class Api::V1::UsersController < ApplicationController
 def create
   user = User.new({ 
    name: params[:user][:name], 
    email: params[:user][:email], 
    api_key: SecureRandom.hex(15)
    })

  if user.save
   render json: UserSerializer.new(user), status: :created
  else
    render json: { error: "Email has already been taken." }, status: :bad_request
  end
 end
end