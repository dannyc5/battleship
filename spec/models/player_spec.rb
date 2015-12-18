require 'rails_helper'

describe Player do
  describe '#ship_at?' do
    let!(:ship) { create(:ship, board_id: board.id) }
    let(:board) { create(:board, player_id: bot.id) }
    let(:bot) { create(:bot) }

    let(:wrong_ship_coordinates) { {row: 1, column: 2} }
    let(:right_ship_coordinates) { ship.coordinates }

    context 'player has ship at given coordinate' do
      it 'returns true' do
        expect(bot.ship_at?(right_ship_coordinates)).to be_truthy
      end
    end

    context 'player does not have ship at given coordinate' do
      it 'returns false' do
        expect(bot.ship_at?(wrong_ship_coordinates)).to be_falsey
      end
    end
  end
end
