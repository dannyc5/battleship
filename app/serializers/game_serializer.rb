class GameSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :human_id, :bot_id, :winner_id

  def human_id
    object.human.try :id
  end

  def bot_id
    object.bot.id
  end
end
