class Player < ActiveRecord::Base
  belongs_to :game
  has_one :board

  delegate :ships, to: :board

  def human?
    type == 'human'
  end

  def bot?
    type == 'bot'
  end
end
