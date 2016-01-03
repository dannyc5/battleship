require 'rails_helper'

describe PlayerBoard do
  it 'creates cells after_create' do
    expect{
      create(:human_board)
    }.to change(Cell, :count).by 25
  end

  # describe '#generate_bot_ships' do
  #   let(:board) { create(:board) }

  #   it 'creates the correct number of allowed ships' do
  #     expect {
  #       board.generate_bot_ships!
  #     }.to change(Ship, :count).by Board::SHIPS_ALLOWED
  #   end
  # end
end
