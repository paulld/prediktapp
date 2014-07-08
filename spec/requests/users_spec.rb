require 'spec_helper'
describe "Users API", type: :request do

let(:user) { Fabricate(:user) }

  describe "GET /api/users" do
    it "returns all users" do
      Fabricate.times(3, :user)

      get "/api/users", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"].length).to eq 3
    end
  end

  describe "GET /api/users/:ids" do
    
    it "with 1 id, returns 1 user" do
      get "/api/users/#{user.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"].length).to eq 1
      expect(body["users"][0]["id"]).to eq user.id
    end
  
    it "with 2 ids, returns the 2 users" do
      users = Fabricate.times(3, :user)

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


  describe "PUT /api/users/:id" do
    let!(:params) { Fabricate.attributes_for(:user) }
    let!(:user) { Fabricate(:user) }

    it "creates a new user with :id" do
      id = SecureRandom.uuid

      expect {
        put "/api/users/#{id}", { user: params }, { "Accept" => "application/json" }
      }.to change { User.count }.by(1)

      expect(response.status).to eq 201
    end

    it "replaces the user with :id" do
      put "/api/users/#{user.id}", { user: params }, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["users"][0]["email"]).to eq params["email"]
    end
  end


  describe "PATCH /api/users/:id" do
    let(:params) { Fabricate.attributes_for(:user) }

    it "updates the user with :id" do
      patch "/api/users/#{user.id}", { user: params },
        { "Accept" => "application/json" }

      expect(response.status).to eq 204
      expect(User.find_by(id: user.id).email).to eq params["email"]
    end
  end
end