class Game < ActiveRecord::Base
  belongs_to :winner, class_name: PlayerBoard
  has_many :player_boards
  has_one :human_board
  has_one :bot_board

  # def respond_to_human!
  #   set_winner! human_board

  #   unless won?
  #     bot_board.generate_move!
  #     set_winner! bot_board
  #   end
  # end

  def won?
    winner_id.present?
  end

  # private

  # def set_winner!(player_board)
  #   if !won? && player_board.moves.hits.count == Board::SHIPS_ALLOWED
  #     update!(winner: player_board)
  #   end
  # end
end
