class Cell < ActiveRecord::Base
  belongs_to :player_board
  has_one :ship
  has_one :move

  validates_presence_of :player_board_id
  validates_uniqueness_of :row, scope: [:column, :player_board_id]
  validates_inclusion_of :row, :in => PlayerBoard::SIZE
  validates_inclusion_of :column, :in => PlayerBoard::SIZE

  default_scope { order(row: :asc, column: :asc) }
end
