class Ship < ActiveRecord::Base
  belongs_to :board

  validates_uniqueness_of :row, scope: [:column, :board_id]
  validates_inclusion_of :row, :in => Board::SIZE
  validates_inclusion_of :column, :in => Board::SIZE

  def coordinates
    {
      row: row,
      column: column
    }
  end
end
