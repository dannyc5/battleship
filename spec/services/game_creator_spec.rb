require 'rails_helper'

describe GameCreator do
  let(:human_name) { Faker::Name.name }
  let(:ship_coordinates) { valid_ship_coordinates }
  let(:result) { GameCreator.new(human_name, ship_coordinates).execute }

  describe '#execute' do
    context 'invalid ship input' do
      let(:ship_coordinates) { invalid_ship_coordinates }

      it 'sets invalid ship count error' do
        expect(result.errors).not_to be_empty
      end
    end

    context 'valid ship input' do
      it 'creates a human with a board' do
        expect(result.game.human).not_to be_nil
        expect(result.game.human.board).not_to be_nil
      end

      it 'creates a bot with a board' do
        expect(result.game.bot).not_to be_nil
        expect(result.game.bot.board).not_to be_nil
      end

      it 'generates ships for the bot' do
        expect(result.game.bot.ships.count).to eq Board::SHIPS_ALLOWED
      end

      it 'sets the ships specified for the human' do
        expect(result.game.human.ships.count).to eq Board::SHIPS_ALLOWED
        expect(result.game.human.ships.pluck(:row, :column)).to eq ship_coordinates.map(&:values)
      end
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
