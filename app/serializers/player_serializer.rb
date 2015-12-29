class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_id, :type
  has_one :board
end
