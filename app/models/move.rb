class Move < ActiveRecord::Base
  include Griddable

  belongs_to :player

  validates_presence_of :player_id, :row, :column
  validates_uniqueness_of :row, scope: [:column, :player_id]
  validates_inclusion_of :row, :in => Board::SIZE
  validates_inclusion_of :column, :in => Board::SIZE

  delegate :game, to: :player

  def hit
    game.hit? self, player
  end
end
