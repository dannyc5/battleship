class Game < ActiveRecord::Base
  belongs_to :winner, class_name: Player
  has_many :player_boards
  has_one :human_board
  has_one :bot_board

  # def respond_to_human!
  #   set_winner! human

  #   unless won?
  #     bot.generate_move!
  #     set_winner! bot
  #   end
  # end

  # def hit?(coordinates, player)
  #   player.opponent.ship_at? coordinates
  # end

  # def won?
  #   winner_id.present?
  # end

  # private

  # def set_winner!(player)
  #   if !won? && player.moves.where(hit: true).count == Board::SHIPS_ALLOWED
  #     update!(winner: player)
  #   end
  # end
end
