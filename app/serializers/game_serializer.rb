class GameSerializer < ActiveModel::Serializer
  attributes :id, :winner_id
  # has_many :players, polymorphic: true
  has_one :human
  has_one :bot
end
