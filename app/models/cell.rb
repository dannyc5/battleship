class Cell < ActiveRecord::Base
  belongs_to :player_board
  has_one :ship
  has_one :move

  # def generate_bot_ships!
  #   ships.create! generated_ship_attrs
  # end

  # def generate_move_coordinate
  #   select_random_open_coordinate
  # end

  # private

  # def generated_ship_attrs
  #   all_coordinates.sample(SHIPS_ALLOWED).map do |coordinate|
  #     {
  #       row: coordinate.first,
  #       column: coordinate.second
  #     }
  #   end
  # end

  # def select_random_open_coordinate
  #   coordinate = open_coordinates.sample

  #   {
  #     row: coordinate.first,
  #     column: coordinate.second
  #   }
  # end

  # def open_coordinates
  #   all_coordinates - ships.pluck(:row, :column)
  # end
end
