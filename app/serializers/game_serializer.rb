class GameSerializer < ActiveModel::Serializer
  attributes :id, :winner_id

  has_one :human, polymorphic: true
  has_one :bot, polymorphic: true
end
