require 'rails_helper'

describe GameCreator do
  let(:result) { GameCreator.new.execute }

  describe '#execute' do
    it 'creates a bot with a board' do
      expect(result.game.bot).not_to be_nil
      expect(result.game.bot.board).not_to be_nil
    end

    it 'generates ships for the bot' do
      expect(result.game.bot.ships.count).to eq Board::SHIPS_ALLOWED
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
