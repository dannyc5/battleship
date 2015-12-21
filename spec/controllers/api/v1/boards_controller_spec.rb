require 'rails_helper'

describe Api::V1::BoardsController do
  let(:human) { create(:human) }
  let(:valid_params) { {board: {player_id: human.id, ships: valid_ship_coordinates}} }

  describe 'POST create' do
    it 'responds with a 200' do
      post :create, valid_params
      expect(response).to be_ok
    end

    it 'responds with a new board for a human with ships' do
      post :create, valid_params
      expect(response_json['board']).not_to be_empty
      expect(response_json['board']['ships'][0]).not_to be_empty
    end
  end
end
