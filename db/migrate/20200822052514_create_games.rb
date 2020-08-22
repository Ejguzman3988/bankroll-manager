class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :poker_site, null: false, foreign_key: true
      t.belongs_to :game_type, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
