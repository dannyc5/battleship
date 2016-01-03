require 'rails_helper'

describe Api::V1::GamesController do
  describe 'GET index' do
    it 'responds with a 200' do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    it 'responds with a 200' do
      post :create
      expect(response).to be_ok
    end

    it 'responds in accordance with the JSON api' do
      post :create
      expect(response_json['data']).not_to be_empty
    end
  end

  describe 'DELETE destroy' do
    let!(:game) { create(:game, :with_player_boards) }

    it 'destroys a game' do
      expect {
        delete :destroy, id: game.id
      }.to change(Game, :count).by -1
    end
  end
end
