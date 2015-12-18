class Move < ActiveRecord::Base
  belongs_to :player

  validates_presence_of :player_id, :row, :column
  validates_uniqueness_of :row, scope: [:column, :player_id]
  validates_inclusion_of :row, :in => Board::SIZE
  validates_inclusion_of :column, :in => Board::SIZE

  delegate :game, to: :player

  def opponent
    Player.where(game_id: player.game_id).where.not(id: player_id).take
  end

  def hit
    opponent.ship_at?(row: row, column: column)
  end
end
