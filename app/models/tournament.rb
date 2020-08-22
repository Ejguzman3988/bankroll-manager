class Tournament < ApplicationRecord
    has_many :games, as: :game_type
    has_many :users, through: :games
    has_one :poker_site, through: :games
end
