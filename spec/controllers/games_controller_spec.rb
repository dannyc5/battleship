require 'rails_helper'

describe GamesController do
  describe 'GET index' do
    it 'responds with a 200' do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    let(:valid_params) { {human: {name: Faker::Lorem.name}} }

    it 'creates a new game' do
      expect {
        post :create, valid_params
      }.to change(Player, :count).by 2
    end
  end
end
