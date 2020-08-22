class Game < ApplicationRecord
  belongs_to :user
  belongs_to :poker_site
  belongs_to :game_type, polymorphic: true
end
