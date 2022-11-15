class Api::V1::UsersController < ApplicationController
 def create
   user = User.create(
     name: params[:user][:name],
     email: params[:user][:email],
   )
 end
end