class PlayerBoardSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :game
end
