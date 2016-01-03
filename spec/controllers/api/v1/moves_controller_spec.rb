require 'rails_helper'

describe Api::V1::MovesController do
  # describe 'POST create' do
  #   let(:game)         { create(:game) }
  #   let(:human)        { create(:human, game_id: game.id)}
  #   let(:bot)          { create(:bot, game_id: game.id)}
  #   let!(:human_board) { create(:board, player_id: human.id)}
  #   let!(:bot_board)   { create(:board, player_id: bot.id)}

  #   context 'valid missing move' do
  #     let(:params) { {move: {player_id: human.id, row: 2, column: 2}} }

  #     it 'returns 200' do
  #       allow(game).to receive(:respond_to_human!).and_return(true)
  #       post :create, params
  #       expect(response.status).to eq 200
  #     end

  #     it 'returns the new move object as a miss' do
  #       allow(game).to receive(:respond_to_human!).and_return(true)
  #       post :create, params
  #       expect(response_json['move']).not_to be_empty
  #       expect(response_json['move']['hit']).to be_falsey
  #     end

  #     it 'checks if there has been a winner' do
  #       expect_any_instance_of(Game).to receive(:respond_to_human!).and_return(true)
  #       post :create, params
  #     end
  #   end

  #   context 'valid hitting move' do
  #     let!(:ship) { create(:ship, board_id: bot_board.id) }
  #     let(:params) { {move: {player_id: human.id, row: 1, column: 1}} }

  #     it 'returns the new move object as a hit' do
  #       allow(game).to receive(:respond_to_human!).and_return(true)
  #       post :create, params
  #       expect(response_json['move']).not_to be_empty
  #       expect(response_json['move']['hit']).to be_truthy
  #     end

  #     it 'checks if there has been a winner' do
  #       expect_any_instance_of(Game).to receive(:respond_to_human!).and_return(true)
  #       post :create, params
  #     end
  #   end

  #   context 'invalid move' do
  #     let(:params) { {move: {player_id: human.id, row: 0, column: 0}} }

  #     it 'returns 422' do
  #       post :create, params
  #       expect(response.status).to eq 422
  #     end
  #   end
  # end
end
