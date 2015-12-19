class Player < ActiveRecord::Base
  belongs_to :game
  has_one :board
  has_many :moves

  delegate :ships, to: :board

  def ship_at?(row:, column:)
    ships.exists?(row: row, column: column)
  end
end
