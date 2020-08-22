class CreatePokerSites < ActiveRecord::Migration[6.0]
  def change
    create_table :poker_sites do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
