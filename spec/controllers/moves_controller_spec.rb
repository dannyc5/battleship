require 'rails_helper'

describe MovesController do
  describe 'POST create' do
    let(:game)         { create(:game) }
    let(:human)        { create(:human, game_id: game.id)}
    let(:bot)          { create(:bot, game_id: game.id)}
    let!(:human_board) { create(:board, player_id: human.id)}
    let!(:bot_board)   { create(:board, player_id: bot.id)}

    context 'valid missing move' do
      let(:params) { {move: {player_id: human.id, row: 2, column: 2}} }

      before do
        post :create, params
      end

      it 'returns 200' do
        expect(response.status).to eq 200
      end

      it 'returns the new move object as a miss' do
        expect(response_json['move']).not_to be_empty
        expect(response_json['move']['hit']).to be_falsey
      end
    end

    context 'valid hitting move' do
      let!(:ship) { create(:ship, board_id: bot_board.id) }
      let(:params) { {move: {player_id: human.id, row: 1, column: 1}} }

      before do
        post :create, params
      end

      it 'returns the new move object as a hit' do
        expect(response_json['move']).not_to be_empty
        expect(response_json['move']['hit']).to be_truthy
      end
    end

    context 'invalid move' do
      let(:params) { {move: {player_id: human.id, row: 0, column: 0}} }

      before do
        post :create, params
      end

      it 'returns 422' do
        expect(response.status).to eq 422
      end
    end
  end
end
