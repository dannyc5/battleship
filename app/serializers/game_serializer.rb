class GameSerializer < ActiveModel::Serializer
  attributes :human, :bot

  def human
    PlayerSerializer.new(object.human).serializable_object
  end
end
