class Tournament < ApplicationRecord
    has_many :games, as: :game_type
    has_many :users, through: :games
    belongs_to :poker_site

    validates :name, presence: true
    validates :start_date, presence: true
    validates :status, presence: true
    validates :buy_in, presence: true

    scope :registering, -> {where(status: 'registering')}
    scope :late_reg, -> {where(status: 'late registration')}
    scope :running, -> {where(status: 'running')}
end
