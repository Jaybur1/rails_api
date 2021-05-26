require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it "authenticate the client" do
      post '/api/v1/authenticate', params: {username: 'BookSeller99', password: 'SecretPassword1'}
      expect(response).to have_http_status(:created)
      expect(response_body).to eq({
        "token" => '123'
      }

      )
    end

    it 'returns error when error username is missing' do
      post '/api/v1/authenticate', params: {password: 'SecretPassword1'}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({
        "error" => 'param is missing or the value is empty: username'
      })
    end

    it 'returns error when error password is missing' do
      post '/api/v1/authenticate', params: {username: 'BookSeller99'}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({
        "error" => 'param is missing or the value is empty: password'
      })
    end
  end
end