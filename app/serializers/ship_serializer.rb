class ShipSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :board_id, :created_at, :updated_at
end
