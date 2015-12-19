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
end
