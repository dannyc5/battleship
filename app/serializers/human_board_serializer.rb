class HumanBoardSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :ships
end
