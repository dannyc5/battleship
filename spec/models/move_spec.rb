require 'rails_helper'

describe Move do
  describe '#opponent' do
    describe 'returns the other player in the game' do
      let(:game)   { create(:game) }
      let!(:human) { create(:human, game_id: game.id)}
      let!(:bot)   { create(:bot, game_id: game.id)}

      context 'called on human' do
        let(:move)   { create(:move, player_id: human.id) }

        it 'returns the bot' do
          expect(move.opponent.id).to eq bot.id
        end
      end

      context 'called on bot' do
        let(:move)   { create(:move, player_id: bot.id) }

        it 'returns the human' do
          expect(move.opponent.id).to eq human.id
        end
      end
    end
  end
end
