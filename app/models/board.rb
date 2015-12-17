class Board < ActiveRecord::Base
  belongs_to :player
  has_many :ships

  SHIPS_ALLOWED = 10
  ROW_RANGE = 1..5
  COL_RANGE = 1..5

  def generate_bot_ships
    # PENDING
  end
end
