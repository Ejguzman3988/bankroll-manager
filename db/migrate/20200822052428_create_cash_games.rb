class CreateCashGames < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_games do |t|
      t.string :name # Presence true uniqueness for pokersite
      t.string :stake # presence true
      t.integer :max_players # Can't be more than 9 or less than 2
      t.decimal :buy_in, :precision => 8, :scale => 2 # presence true
      t.integer :poker_site_id
      t.timestamps
    end
  end
end
