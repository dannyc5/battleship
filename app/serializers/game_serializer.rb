class GameSerializer < ActiveModel::Serializer
  attributes :id, :winner_id, :created_at, :updated_at
  has_many :players, polymorphic: true, serializer: PlayerSerializer
end
