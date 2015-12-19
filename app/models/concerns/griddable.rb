module Griddable
  extend ActiveSupport::Concern

  def coordinates
    {
      row: row,
      column: column
    }
  end
end
