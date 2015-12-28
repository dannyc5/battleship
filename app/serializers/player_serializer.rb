class PlayerSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true

  attributes :id, :game_id, :name, :board_id

  def board_id
    object.board.id
  end
end
