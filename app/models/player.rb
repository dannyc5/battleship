class Player < ActiveRecord::Base
  belongs_to :game
  has_one :board

  delegate :ships, to: :board
end
