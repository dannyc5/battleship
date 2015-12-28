class ShipSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :row, :column, :board_id
end
