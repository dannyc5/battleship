class BotBoard < PlayerBoard
  def opponent
    game.human_board
  end

  # def generate_move!
  #   moves.create board.generate_move_coordinate
  # end

  def generate_bot_ships!
    ActiveRecord::Base.transaction do
      random_cells.map do |cell|
        cell.create_ship!
      end
    end
  end

  # def generate_move_coordinate
  #   select_random_open_coordinate
  # end

  private

  def random_cells
    cells.sample(SHIPS_ALLOWED)
  end

  # def select_random_open_coordinate
  #   coordinate = open_coordinates.sample

  #   {
  #     row: coordinate.first,
  #     column: coordinate.second
  #   }
  # end

  # def open_coordinates
  #   all_coordinates - ships.pluck(:row, :column)
  # end
end
