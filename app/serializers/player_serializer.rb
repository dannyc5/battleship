class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_id, :type, :created_at, :updated_at
  has_one :board
end
