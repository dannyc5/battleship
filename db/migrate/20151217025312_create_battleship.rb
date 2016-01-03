class CreateBattleship < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.timestamps null: false
    end

    create_table :player_boards do |t|
      t.integer :game_id, null: false
      t.string :type, null: false, limit: 255
      t.string :name, null: false, limit: 255
      t.timestamps null: false
    end

    create_table :cells do |t|
      t.integer :player_board_id, null: false
      t.integer :row, null: false
      t.integer :column, null: false
      t.timestamps null: false
    end

    create_table :moves do |t|
      t.integer :cell_id, null: false
      t.boolean :hit, null: false, default: false
      t.timestamps null: false
    end

    create_table :ships do |t|
      t.integer :cell_id, null: false
      t.timestamps null: false
    end
  end
end
