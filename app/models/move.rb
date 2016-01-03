class Move < ActiveRecord::Base
  belongs_to :cell
  delegate :player_board, to: :cell

  validates_presence_of :cell_id
  validates_uniqueness_of :cell_id
  validates :hit, :inclusion => {:in => [true, false]}
  before_validation :set_hit

  scope :hits, -> { where(hit: true) }

  private

  def set_hit
    self.hit = cell.ship.present?
    self
  end
end
