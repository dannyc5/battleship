class ShipSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :board_id, :row, :column
end
