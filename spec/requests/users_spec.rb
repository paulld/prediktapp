require 'spec_helper'

describe "Users API", type: :request do
  describe "GET /api/users" do
    it "returns all users" do
      Fabricate.times(3, :user)

      get "/api/users", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      
      # expect(2).to.eq 2
      expect(body["users"].length).to eq 3
    end
  end

  describe "GET /api/users/:ids with 1 user" do
    let!(:users) { Fabricate.times(3, :user) }
    
    it "returns the user" do

      get "/api/users/#{users[0].id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"].length).to eq 1
      expect(body["users"][0]["id"]).to eq users[0].id
    end
  end

  describe "GET /users/:ids with 2 users" do
    let!(:users) { Fabricate.times(3, :user) }
    
    it "returns the 2 users" do

      get "/api/users/#{users[1].id},#{users[2].id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      
      expect(body["users"].length).to eq 2
      expect(body["users"][0]["id"]).to eq users[1].id
      expect(body["users"][1]["id"]).to eq users[2].id
    end
  end

end
