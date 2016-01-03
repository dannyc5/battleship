require 'rails_helper'

describe Api::V1::HumanBoardsController do
  let(:game) { create(:game) }
  let(:name) { Faker::Name.name }
  let(:valid_params) { {human_board: {name: name, game_id: game.id}} }

  describe 'POST create' do
    it 'responds with a 200' do
      post :create, valid_params
      expect(response).to be_ok
    end

    it 'responds with a new board for a human with cells using JSON API schema' do
      post :create, valid_params
      expect(response_json['data']).not_to be_empty
      expect(response_json['data']['attributes']['name']).to eq name
      expect(response_json['data']['relationships']['cells']['data'].count).to eq PlayerBoard::CELLS
    end
  end
end
