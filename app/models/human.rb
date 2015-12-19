class Human < Player
  def opponent
    game.bot
  end
end
