class Bot < Player
  def opponent
    game.human
  end
end
