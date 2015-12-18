class MoveSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :row, :column, :hit
end
