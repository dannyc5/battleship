require 'rails_helper'

describe HumanBoardCreator do
  let(:human) { create(:human) }
  let(:ship_coordinates) { valid_ship_coordinates }
  let(:result) { HumanBoardCreator.new(human, ship_coordinates).execute }

  describe '#execute' do
    context 'invalid ship input' do
      let(:ship_coordinates) { invalid_ship_coordinates }

      it 'sets invalid ship count error' do
        expect(result.errors).not_to be_empty
      end
    end

    context 'valid ship input' do
      it 'creates a human with a board' do
        expect(result.human).not_to be_nil
        expect(result.human.board).not_to be_nil
      end

      it 'sets the ships specified for the human' do
        expect(result.human.ships.count).to eq Board::SHIPS_ALLOWED
        expect(result.human.ships.pluck(:row, :column)).to eq ship_coordinates.map(&:values)
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
