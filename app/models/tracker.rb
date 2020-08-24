class Tracker < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  scope :won_total, ->(user, tourney) { where( user_id: user.id, tournament_id: tourney.id).collect{|t| t.winnings}.inject(0){|sum,x| sum + x } }

end
