class Ship < ActiveRecord::Base
  # include Locatable

  belongs_to :cell
  delegate :player_board, to: :cell

  # validates_uniqueness_of :row, scope: [:column, :board_id]
  # validates_inclusion_of :row, :in => Board::SIZE
  # validates_inclusion_of :column, :in => Board::SIZE
  validate :under_ship_limit

  private

  def under_ship_limit
    if player_board.cells.with_ships.count >= Board::SHIPS_ALLOWED
      errors.add :board_id, "Board already has enough ships."
    end
  end
end
