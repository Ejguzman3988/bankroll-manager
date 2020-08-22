class CreateCashGames < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_games do |t|
      t.string :name
      t.string :stake
      t.integer :max_players
      t.decimal :buy_in, :precision => 8, :scale => 2
      t.decimal :won, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
