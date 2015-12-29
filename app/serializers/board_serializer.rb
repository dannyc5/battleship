class BoardSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :created_at, :updated_at

  has_many :ships
  has_one :player, polymorphic: true
end
