class BotBoard < PlayerBoard
  def opponent_board
    game.human_board
  end

  def generate_bot_ships!
    ActiveRecord::Base.transaction do
      random_cells.map(&:create_ship!)
    end
  end

  private

  def random_cells
    cells.sample(SHIPS_ALLOWED)
  end
end
