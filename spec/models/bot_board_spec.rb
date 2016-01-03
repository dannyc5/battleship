require 'rails_helper'

describe BotBoard do
  describe '#generate_bot_ships!' do
    let(:bot_board) { create(:bot_board) }

    it 'creates the number of ships allowed on the board for the board cells' do
      bot_board.generate_bot_ships!
      expect(bot_board.ships.count).to eq PlayerBoard::SHIPS_ALLOWED
    end
  end
end
