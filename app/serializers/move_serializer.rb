class MoveSerializer < ActiveModel::Serializer
  attributes :id, :row, :column, :hit
  belongs_to :player
end
