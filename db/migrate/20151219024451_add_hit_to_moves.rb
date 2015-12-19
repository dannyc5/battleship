class AddHitToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :hit, :boolean, null: false, default: false
  end
end
