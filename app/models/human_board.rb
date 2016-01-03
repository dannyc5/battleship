class HumanBoard < PlayerBoard
  def opponent
    game.bot_board
  end

  def generate_opponent_move!
    open_cell.create_move!
  end

  private

  def open_cell
    coordinate = open_cells.sample
  end

  def open_cells
    cells.joins("LEFT JOIN moves ON moves.cell_id = cells.id").where(moves: {id: nil})
  end
end
