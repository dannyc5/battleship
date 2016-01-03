class Game < ActiveRecord::Base
  belongs_to :winner, class_name: PlayerBoard
  has_many :player_boards
  has_many :cells, through: :player_boards
  has_many :moves, through: :cells
  has_one :human_board
  has_one :bot_board

  def respond_to_human_board!
    set_winner! human_board

    unless won?
      human_board.generate_opponent_move!
      set_winner! bot_board
    end
  end

  def won?
    winner_id.present?
  end

  private

  def set_winner!(player_board)
    if !won? && player_board.opponent_board.moves.hits.count == PlayerBoard::SHIPS_ALLOWED
      update!(winner: player_board)
    end
  end
end
