class CashGame < ApplicationRecord
    has_many :games, as: :game_type
    has_many :users, through: :games
    belongs_to :poker_site
end
