class GameSerializer < ActiveModel::Serializer
  attributes :id, :winner_id, :created_at, :updated_at

  has_one :human, polymorphic: true
  has_one :bot, polymorphic: true
end
