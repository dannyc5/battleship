class GameSerializer < ActiveModel::Serializer
  attributes :id, :human, :bot

  def human
    PlayerSerializer.new(object.human).serializable_object
  end

  def bot
    PlayerSerializer.new(object.bot).serializable_object
  end
end
