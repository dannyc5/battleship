require 'rails_helper'

describe Ship do
  # describe 'validates ship coordinates are within board' do
  #   context 'board already has max ships' do
  #     let!(:board) { create(:board) }
  #     let(:extra_ship) { build(:ship, board_id: board.id, row: 4, column: 4) }

  #     before do # create ten ships
  #       create(:ship, board_id: board.id, row: 1, column: 1)
  #       create(:ship, board_id: board.id, row: 1, column: 2)
  #       create(:ship, board_id: board.id, row: 1, column: 3)
  #       create(:ship, board_id: board.id, row: 1, column: 4)
  #       create(:ship, board_id: board.id, row: 1, column: 5)

  #       create(:ship, board_id: board.id, row: 2, column: 1)
  #       create(:ship, board_id: board.id, row: 3, column: 1)
  #       create(:ship, board_id: board.id, row: 4, column: 1)
  #       create(:ship, board_id: board.id, row: 5, column: 1)
  #       create(:ship, board_id: board.id, row: 5, column: 5)
  #     end

  #     it 'does not allow any extra ships to be created' do
  #       extra_ship.save
  #       expect(extra_ship.errors).not_to be_empty
  #       expect(extra_ship.errors.first).to include(/Board already has enough ships./)
  #     end
  #   end

  #   context 'coordinate outside board' do
  #     let!(:invalid_ship) { build(:ship, :invalid_coordinate) }

  #     it 'does not save' do
  #       expect{
  #         invalid_ship.save
  #       }.to change(Ship, :count).by 0
  #     end

  #     it 'sets a validation error on the object' do
  #       invalid_ship.save
  #       expect(invalid_ship.errors).not_to be_empty
  #     end
  #   end

  #   context 'coordinate within board' do
  #     let(:ship) { build(:ship) }

  #     it 'saves' do
  #       expect {
  #         ship.save
  #       }.to change(Ship, :count).by 1
  #     end
  #   end
  # end
end
