class Move < ActiveRecord::Base
  # include Locatable

  belongs_to :cell
  delegate :player_board, to: :cell

  # validates_presence_of :player_id, :row, :column
  # validates_uniqueness_of :row, scope: [:column, :player_id]
  # validates_inclusion_of :row, :in => Board::SIZE
  # validates_inclusion_of :column, :in => Board::SIZE

  # before_validation :set_hit

  # private

  # def set_hit
  #   self.hit = game.hit? coordinates, player
  #   self
  # end
end
