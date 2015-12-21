class GameSerializer < ActiveModel::Serializer
  attributes :id, :human, :bot, :winner_id

  def human
    PlayerSerializer.new(object.human).serializable_object if object.human.present?
  end

  def bot
    PlayerSerializer.new(object.bot).serializable_object
  end
end
