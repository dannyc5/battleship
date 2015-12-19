class Bot < Player
  def opponent
    game.human
  end

  def generate_move!
    moves.create board.generate_move_coordinate
  end
end
