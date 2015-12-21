require 'rails_helper'

describe Api::V1::GamesController do
  describe 'GET index' do
    it 'responds with a 200' do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'POST create' do
    let(:human_name) { Faker::Name.name }

    context 'valid params' do
      let(:valid_params) { {human: {name: human_name, ships: valid_ship_coordinates}} }

      it 'responds with a the nested game json' do
        post :create, valid_params
        expect(response_json['game']).not_to be_empty
        expect(response_json['game']['human']['name']).to eq human_name
        expect(response_json['game']['human']['board']).not_to be_empty
        expect(response_json['game']['bot']['name']).not_to be_empty
      end
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
