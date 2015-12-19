class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :name, :board

  def board
    object.type.camelize.concat('BoardSerializer').constantize.new(object.board).serializable_object
  end
end
