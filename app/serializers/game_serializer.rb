class GameSerializer < ActiveModel::Serializer
  attributes :id, :human, :bot, :winner_id
  has_one :human, serializer: PlayerSerializer
  has_one :bot, serializer: PlayerSerializer
end
