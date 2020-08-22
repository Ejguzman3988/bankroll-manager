class PokerSite < ApplicationRecord
    has_many :games
    has_many :users, through: :games
    has_many :tournaments, through: :games
    has_many :cash_games, through: :games
end
