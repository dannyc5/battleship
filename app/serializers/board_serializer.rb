class BoardSerializer < ActiveModel::Serializer
  attributes :id, :player_id

  has_many :ships
  has_one :player, polymorphic: true
end
