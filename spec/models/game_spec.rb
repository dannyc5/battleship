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

  describe '#respond_to_human!' do
    let(:human) { create(:human, game_id: game.id) }
    let(:bot) { create(:bot, game_id: game.id) }
    let!(:human_board) { create(:board, player_id: human.id) }
    let!(:bot_board) { create(:board, player_id: bot.id) }

    context 'human has won' do
      before do
        create(:ship, board_id: bot_board.id, row: 1, column: 1)
        create(:ship, board_id: bot_board.id, row: 1, column: 2)
        create(:ship, board_id: bot_board.id, row: 1, column: 3)
        create(:ship, board_id: bot_board.id, row: 1, column: 4)
        create(:ship, board_id: bot_board.id, row: 1, column: 5)
        create(:ship, board_id: bot_board.id, row: 3, column: 2)
        create(:ship, board_id: bot_board.id, row: 2, column: 1)
        create(:ship, board_id: bot_board.id, row: 3, column: 1)
        create(:ship, board_id: bot_board.id, row: 4, column: 1)
        create(:ship, board_id: bot_board.id, row: 5, column: 1)

        create(:move, player_id: human.id, row: 1, column: 1, hit: true)
        create(:move, player_id: human.id, row: 1, column: 2, hit: true)
        create(:move, player_id: human.id, row: 1, column: 3, hit: true)
        create(:move, player_id: human.id, row: 1, column: 4, hit: true)
        create(:move, player_id: human.id, row: 1, column: 5, hit: true)
        create(:move, player_id: human.id, row: 3, column: 2, hit: true)
        create(:move, player_id: human.id, row: 2, column: 1, hit: true)
        create(:move, player_id: human.id, row: 3, column: 1, hit: true)
        create(:move, player_id: human.id, row: 4, column: 1, hit: true)
        create(:move, player_id: human.id, row: 5, column: 1, hit: true)
      end

      it 'sets human as winner' do
        expect(game.winner_id).to be_nil
        game.respond_to_human!
        expect(game.winner_id).to eq human.id
      end
    end

    context 'human has not won' do
      it 'generates a move for the computer' do
        expect {
          game.respond_to_human!
        }.to change(Move, :count).by 1
      end

      context 'computer does not win' do
        it 'does not set winner' do
          expect(game.winner_id).to be_nil
        end
      end

      context 'computer wins' do
        let(:winning_move) { create(:move, player_id: bot.id, row: 1, column: 1, hit: true) }

        before do
          create(:ship, board_id: human_board.id, row: 1, column: 1)
          create(:ship, board_id: human_board.id, row: 1, column: 2)
          create(:ship, board_id: human_board.id, row: 1, column: 3)
          create(:ship, board_id: human_board.id, row: 1, column: 4)
          create(:ship, board_id: human_board.id, row: 1, column: 5)
          create(:ship, board_id: human_board.id, row: 2, column: 2)
          create(:ship, board_id: human_board.id, row: 3, column: 2)
          create(:ship, board_id: human_board.id, row: 2, column: 3)
          create(:ship, board_id: human_board.id, row: 2, column: 4)
          create(:ship, board_id: human_board.id, row: 2, column: 5)

          create(:move, player_id: bot.id, row: 1, column: 2, hit: true)
          create(:move, player_id: bot.id, row: 1, column: 3, hit: true)
          create(:move, player_id: bot.id, row: 1, column: 4, hit: true)
          create(:move, player_id: bot.id, row: 1, column: 5, hit: true)
          create(:move, player_id: bot.id, row: 2, column: 2, hit: true)
          create(:move, player_id: bot.id, row: 3, column: 2, hit: true)
          create(:move, player_id: bot.id, row: 2, column: 3, hit: true)
          create(:move, player_id: bot.id, row: 2, column: 4, hit: true)
          create(:move, player_id: bot.id, row: 2, column: 5, hit: true)
        end

        it 'sets bot as winner' do
          allow_any_instance_of(Bot).to receive(:generate_move!).and_return(winning_move)
          game.respond_to_human!
          expect(game.winner_id).to eq bot.id
        end
      end
    end
  end
end
