class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :name, :board

  def board
    board_serializer.new(object.board).serializable_object
  end

  private

  def board_serializer
    object.type.camelize.concat('BoardSerializer').constantize
  end
end
