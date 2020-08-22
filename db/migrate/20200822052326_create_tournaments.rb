class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.datetime :start_date
      t.string :status
      t.decimal :buy_in, :precision => 8, :scale => 2
      t.decimal :won, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
