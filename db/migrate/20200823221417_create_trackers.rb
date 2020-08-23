class CreateTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :trackers do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
