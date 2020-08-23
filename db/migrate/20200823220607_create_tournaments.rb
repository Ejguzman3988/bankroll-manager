class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.decimal :buy_in

      t.timestamps
    end
  end
end
