class BotBoard < PlayerBoard
  def opponent
    game.human_board
  end

  def generate_bot_ships!
    ActiveRecord::Base.transaction do
      random_cells.map do |cell|
        cell.create_ship!
      end
    end
  end

  private

  def random_cells
    cells.sample(SHIPS_ALLOWED)
  end
end
