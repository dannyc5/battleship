class HumanBoardCreator
  attr_accessor :human, :ship_coordinates, :errors, :board

  def initialize(human, ship_coordinates)
    @human = human
    @ship_coordinates = ship_coordinates
    @errors = []
  end

  def execute
    begin
      check_for_board_and_ships!
      validate_ship_coordinate_input!

      ActiveRecord::Base.transaction do
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

  def check_for_board_and_ships!
    if human.board && human.board.ships.any?
      raise 'Board already exists for this player'
    end
  end

  def create_boards_and_ships
    @board = human.board || human.create_board
    board.ships.create ship_coordinates
  end

  def validate_ship_coordinate_input!
    if ship_coordinates.length != Board::SHIPS_ALLOWED
      raise "Number of ships must be #{Board::SHIPS_ALLOWED}."
    end
  end
end
