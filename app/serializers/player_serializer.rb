class PlayerSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :name, :game_id
  has_one :board
end
