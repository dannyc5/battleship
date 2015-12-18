class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :name, :board

  def board
    if object.human?
      HumanBoardSerializer.new(object.board).serializable_object
    else
      BotBoardSerializer.new(object.board).serializable_object
    end
  end
end
