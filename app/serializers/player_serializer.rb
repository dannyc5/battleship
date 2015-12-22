class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :name, :board_id

  def board_id
    object.board.id
  end
end
