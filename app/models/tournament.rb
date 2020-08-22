class Tournament < ApplicationRecord
    has_many :games, as: :game_type
    has_many :users, through: :games
end
