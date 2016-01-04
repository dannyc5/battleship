class SecretCellSerializer < ActiveModel::Serializer
  attributes :id, :row, :column
  belongs_to :player_board, polymorphic: true
  has_one :move
end
