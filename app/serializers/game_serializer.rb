class GameSerializer < ActiveModel::Serializer
  attributes :id, :winner_id
  # has_many :player_boards, polymorphic: true
  has_one :human_board
  has_one :bot_board
end
