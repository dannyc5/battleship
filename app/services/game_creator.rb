class GameCreator
  # attr_accessor :game, :errors

  # def initialize
  #   @errors = []
  # end

  # def execute
  #   begin
  #     ActiveRecord::Base.transaction do
  #       @game = Game.create
  #       create_bot
  #       create_bot_board
  #     end
  #   rescue StandardError => e
  #     errors << e.message
  #   end

  #   self
  # end

  # def success?
  #   errors.blank?
  # end

  # private

  # def create_bot
  #   game.create_bot(name: BotNameGenerator.instance.execute)
  # end

  # def create_bot_board
  #   bboard = game.create_bot_board
  #   bboard.generate_bot_ships!
  # end
end
