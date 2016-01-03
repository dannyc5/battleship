require 'rails_helper'

describe GameCreator do
  let(:result) { GameCreator.new.execute }

  describe '#execute' do
    it 'creates a bot_board with cells' do
      expect(result.game.bot_board).not_to be_nil
      expect(result.game.bot_board.cells).not_to be_empty
    end

    it 'generates ships for the bot' do
      expect(result.game.bot_board.ships.count).to eq PlayerBoard::SHIPS_ALLOWED
    end
  end

  describe '#success' do
    context 'errors blank' do
      it 'returns true' do
        expect(result.success?).to be_truthy
      end
    end

    context 'errors present' do
      it 'returns false' do
        result.errors << 'error'
        expect(result.success?).to be_falsey
      end
    end
  end
end
