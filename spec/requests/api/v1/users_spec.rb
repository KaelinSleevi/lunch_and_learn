require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    it 'can register a user' do
     headers = { "CONTENT_TYPE" => "application/json" }

     user_params = { 'name': "Ray Charles", 'email': "raybay@guhmail.com" }

     post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_data = JSON.parse(response.body, symbolize_names: true)

      expect(user_data).to have_key(:data)
    end
  end
end