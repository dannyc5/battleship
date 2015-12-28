class HumanBoardSerializer < ActiveModel::Serializer
  attributes :id, :player_id
  has_many :ships
end
