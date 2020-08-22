class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :poker_site, null: false, foreign_key: true
      t.string :name # presence true -- e.g. NLH/PLO/STUD
      t.decimal :won, precision: 8, scale: 2 # User-Game relation profit
      t.bigint  :game_type_id
      t.string  :game_type_type

      t.timestamps
    end

    add_index :games, [:game_type_type, :game_type_id]
  end
end
