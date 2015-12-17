class GameCreator
  attr_accessor :game, :name, :ship_coordinates, :errors

  def initialize(name, ship_coordinates)
    @name = name
    @ship_coordinates = ship_coordinates
    @errors = []
  end

  def execute
    begin
      validate_ship_coordinate_input!

      ActiveRecord::Base.transaction do
        @game = Game.create
        create_players
        create_boards_and_ships
      end
    rescue StandardError => e
      errors << e.message
    end

    self
  end

  def success?
    errors.blank?
  end

  private

  def create_players
    game.create_human(name: name)
    game.create_bot(name: BotNameGenerator.instance.execute)
  end

  def create_boards_and_ships
    hboard = game.human.create_board
    bboard = game.bot.create_board

    hboard.ships.create ship_coordinates
    bboard.generate_bot_ships
  end

  def validate_ship_coordinate_input!
    if ship_coordinates.length != Board::SHIPS_ALLOWED
      raise "Number of ships must be #{Board::SHIPS_ALLOWED}."
    end
  end
end
