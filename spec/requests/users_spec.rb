require 'spec_helper'

describe "GET Users API", type: :request do
  describe "GET /api/users" do
    it "returns all users" do
      Fabricate.times(3, :user)

      get "/api/users", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"].length).to eq 3
    end
  end

  describe "GET /api/users/:ids with 1 user" do
    let!(:user) { Fabricate(:user) }
    
    it "returns a single user" do

      get "/api/users/#{user.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"].length).to eq 1
      expect(body["users"][0]["id"]).to eq user.id
    end
  end

  describe "GET /api/users/:ids with 2 users" do
    let!(:users) { Fabricate.times(3, :user) }
    
    it "returns the 2 users" do

      get "/api/users/#{users[1].id},#{users[2].id}", {},
        { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"].length).to eq 2

      ids = body["users"].map { |u| u["id"] }

      expect(ids).to include users[1].id
      expect(ids).to include users[2].id
    end
  end

  describe "DELETE /api/users/:id" do
    let!(:user) { Fabricate(:user) }

    it "deletes the user with :id" do
      expect {
        delete "/api/users/#{user.id}", {}, { "Accept" => "application/json" }
      }.to change { User.count }.by(-1)

      expect(response.status).to eq 204
      expect(User.find_by(id: user.id)).to be_nil
    end
  end

end