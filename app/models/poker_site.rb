class PokerSite < ApplicationRecord
    has_many :games
    has_many :users, through: :games
    has_many :tournaments
    has_many :cash_games
end
