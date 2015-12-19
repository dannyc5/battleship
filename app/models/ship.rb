class Ship < ActiveRecord::Base
  include Griddable

  belongs_to :board

  validates_uniqueness_of :row, scope: [:column, :board_id]
  validates_inclusion_of :row, :in => Board::SIZE
  validates_inclusion_of :column, :in => Board::SIZE
end
