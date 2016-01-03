require 'rails_helper'

describe Api::V1::MovesController do
  describe 'POST create' do
    let(:game)         { create(:game) }
    let!(:human_board) { create(:human_board, game_id: game.id)}
    let!(:bot_board)   { create(:bot_board, game_id: game.id)}
    let(:cell1)        { bot_board.cells.last }
    let(:cell2)        { bot_board.cells.first }

    context 'valid missing move' do
      let(:params) { {move: {cell_id: cell2.id}} }

      it 'returns 200' do
        allow(game).to receive(:respond_to_human_board!).and_return(true)
        post :create, params
        expect(response.status).to eq 200
      end

      it 'returns the new move object as a miss' do
        allow(game).to receive(:respond_to_human_board!).and_return(true)
        post :create, params
        expect(response_json['data']).not_to be_empty
        expect(response_json['data']['attributes']['hit']).to be_falsey
      end

      it 'checks if there has been a winner' do
        expect_any_instance_of(Game).to receive(:respond_to_human_board!).and_return(true)
        post :create, params
      end
    end

    context 'valid hitting move' do
      let!(:ship)  { create(:ship, cell_id: cell1.id) }
      let(:params) { {move: {cell_id: cell1.id}} }

      it 'returns the new move object as a hit' do
        allow(game).to receive(:respond_to_human_board!).and_return(true)
        post :create, params
        expect(response_json['data']).not_to be_empty
        expect(response_json['data']['attributes']['hit']).to be_truthy
      end

      it 'checks if there has been a winner' do
        expect_any_instance_of(Game).to receive(:respond_to_human_board!).and_return(true)
        post :create, params
      end
    end

    context 'invalid move' do
      let!(:existing_move) { create(:move, cell_id: cell1.id) }
      let(:params)         { {move: {cell_id: cell1.id}} }

      it 'returns 422' do
        post :create, params
        expect(response.status).to eq 422
        expect(response_json['errors']).not_to be_empty
      end
    end
  end
end
