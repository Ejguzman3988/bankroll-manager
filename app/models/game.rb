class Game < ApplicationRecord
  belongs_to :user
  belongs_to :poker_site
  belongs_to :game_type, polymorphic: true

  validates :name, presence: true
  validates :game_type_type, presence: true
  validates :game_type_id, presence: true

end
