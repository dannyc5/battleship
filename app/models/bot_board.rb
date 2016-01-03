class BotBoard < PlayerBoard
  def opponent
    game.human_board
  end

  # def generate_move!
  #   moves.create board.generate_move_coordinate
  # end
end
