class User < ApplicationRecord
 validates_presence_of :name, :email, :api_key
end