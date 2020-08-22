class CreatePokerSites < ActiveRecord::Migration[6.0]
  def change
    create_table :poker_sites do |t|
      t.string :name # presence true, uniqueness true
      t.string :url # presence true

      t.timestamps
    end
  end
end
