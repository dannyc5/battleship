class Ship < ActiveRecord::Base
  belongs_to :cell
  delegate :player_board, to: :cell

  validate :under_ship_limit
  validates_uniqueness_of :cell_id
  validates_presence_of :cell_id

  private

  def under_ship_limit
    if player_board.ships.count >= Board::SHIPS_ALLOWED
      errors.add :cell_id, "Board already has enough ships."
    end
  end
end
