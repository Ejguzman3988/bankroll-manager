class Tournament < ApplicationRecord
    has_many :games, as: :game_type
    has_many :users, through: :games
    belongs_to :poker_site

    scope :registering, -> {where(status: 'registering')}
    scope :late_reg, -> {where(status: 'late registration')}
    scope :running, -> {where(status: 'running')}
end
