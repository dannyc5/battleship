class GameSerializer < ActiveModel::Serializer
  attributes :id, :winner_id
  has_one :winner, serializer: PlayerBoardSerializer
  has_one :human_board
  has_one :bot_board
end
