require 'rails_helper'

describe Game do
  let(:game) { create(:game) }

  describe '#won?' do
    context 'winner_id set' do
      it 'returns true' do
        game.update(winner_id: 0)
        expect(game.won?).to be_truthy
      end
    end

    context 'winner_id not set' do
      it 'returns false' do
        expect(game.won?).to be_falsey
      end
    end
  end

  describe '#respond_to_human_board!' do
    let!(:human_board) { create(:human_board, game_id: game.id) }
    let!(:bot_board) { create(:bot_board, game_id: game.id) }

    context 'human_board has won' do
      before do
        bot_board.generate_bot_ships!
        bot_board.cells.with_ship.each { |cell| cell.create_move! }
      end

      it 'sets human_board as winner' do
        expect(game.winner_id).to be_nil
        game.respond_to_human_board!
        expect(game.winner_id).to eq human_board.id
      end
    end

    context 'human_board has not won' do
      it 'generates a move for the computer' do
        expect {
          game.respond_to_human_board!
        }.to change(Move, :count).by 1
      end

      context 'computer does not win' do
        it 'does not set winner' do
          expect(game.winner_id).to be_nil
        end
      end

      context 'computer wins' do
        before do
          human_board.cells.sample(PlayerBoard::SHIPS_ALLOWED).map(&:create_ship!) # move into factory if need to reuse
          human_board.cells.with_ship.sample(PlayerBoard::SHIPS_ALLOWED).map(&:create_move!)
        end

        it 'sets bot_board as winner' do
          game.respond_to_human_board!
          expect(game.winner_id).to eq bot_board.id
        end
      end
    end
  end
end
