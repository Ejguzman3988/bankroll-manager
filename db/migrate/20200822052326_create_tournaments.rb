class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name # Presence true, unique for pokersite
      t.datetime :start_date # Presense true
      t.datetime :end_date # Set when 1 player left and status==running
      t.integer :late_reg # Presence true
      t.string :status # If Start date less than end_date 
      t.decimal :buy_in, :precision => 8, :scale => 2 # Presence true
      t.integer :poker_site_id
      t.timestamps
    end
  end
end
