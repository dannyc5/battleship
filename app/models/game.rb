class Game < ActiveRecord::Base
  belongs_to :winner, class_name: Player
  has_one :human
  has_one :bot

  def ended?
    winner_id.present?
  end
end
