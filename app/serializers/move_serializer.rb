class MoveSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :row, :column, :player_id, :hit
end
