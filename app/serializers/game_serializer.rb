class GameSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :winner_id

  has_many :players, polymorphic: true
end
