class MoveSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :player_id, :hit
end
