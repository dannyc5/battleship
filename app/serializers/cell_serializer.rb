class CellSerializer < ActiveModel::Serializer
  attributes :id, :row, :column
  belongs_to :player_board, polymorphic: true
  has_one :moves
  has_one :ships
end
