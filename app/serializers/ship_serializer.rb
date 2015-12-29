class ShipSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :board_id
end
