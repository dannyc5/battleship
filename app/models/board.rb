class Board < ActiveRecord::Base
  belongs_to :player
  has_many :ships

  SHIPS_ALLOWED = 10
  SIZE = 1..5

  def generate_bot_ships!
    ships.create! generated_ship_attrs
  end

  private

  def generated_ship_attrs
    possible_coordinates.sample(SHIPS_ALLOWED).map do |coordinate|
      {
        row: coordinate.first,
        column: coordinate.second
      }
    end
  end

  def possible_coordinates
    SIZE.to_a.repeated_permutation(2).to_a
  end
end
