require 'rails_helper'

describe GamesController do
  describe 'GET index' do
    it 'responds with a 200' do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    let(:human_name) { Faker::Name.name }
    let(:valid_params) { {human: {name: human_name}} }

    it 'creates a new game' do
      expect {
        post :create, valid_params
      }.to change(Player, :count).by 2
    end

    it 'responds with a the game information' do
      post :create, valid_params
      expect(response_json['game']).not_to be_empty
      expect(response_json['game']['human']['name']).to eq human_name
      expect(response_json['game']['bot']['name']).not_to be_empty
    end
  end

  describe 'DELETE destroy' do
    let!(:game) { create(:game, :with_players) }

    it 'destroys a game' do
      expect {
        delete :destroy, id: game.id
      }.to change(Game, :count).by -1
    end
  end
end
