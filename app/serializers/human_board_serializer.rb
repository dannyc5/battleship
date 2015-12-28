class HumanBoardSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :player_id
  has_many :ships
end
