require 'rails_helper'

describe Api::V1::BoardsController do
  let(:human) { create(:human) }
  let(:valid_params) { {board: {player_id: human.id, ships: valid_ship_coordinates}} }

  describe 'POST create' do
    it 'responds with a 200' do
      post :create, valid_params
      expect(response).to be_ok
    end
  end
end
