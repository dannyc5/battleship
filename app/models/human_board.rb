class HumanBoard < PlayerBoard
  def opponent
    game.bot_board
  end
end
