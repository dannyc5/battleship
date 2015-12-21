require 'rails_helper'

describe Api::V1::PlayersController do
  let(:game) { create(:game) }
  let(:name) { Faker::Name.name }
  let(:valid_params) { {player: {name: name, game_id: game.id}} }

  describe 'POST create' do
    it 'responds with a 200' do
      post :create, valid_params
      expect(response).to be_ok
    end

    it 'responds with a new board for a human with ships' do
      post :create, valid_params
      expect(response_json['player']).not_to be_empty
      expect(response_json['player']['name']).to eq name
    end
  end
end
