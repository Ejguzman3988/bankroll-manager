class Tournament < ApplicationRecord
    has_many :trackers
    has_many :users, through: :trackers

    validates :name, presence: true, uniqueness: true
    validates :buy_in, presence: true

    scope :user_tourneys, ->(num) { joins(:trackers).where(trackers: {user_id: num}).uniq}
end
