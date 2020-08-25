class Tracker < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  scope :won_total, ->(user, tourney) { where( user_id: user.id, tournament_id: tourney.id).collect{|t| t.winnings}.inject(0){|sum,x| sum + x } }

  scope :roi_total, ->(user, tourney) {where(user_id: user.id, tournament_id: tourney.id).collect{|t| t.roi}.inject(0){|sum,x| sum + x}}
  
  scope :tourney_user_length, ->(tourney, user) { where( tournament_id: tourney.id, user_id: user.id).length }

  scope :tourney_user, -> (tourney, user) {where( tournament_id: tourney.id, user_id: user.id)}


  def roi
    (self.winnings - self.tournament.buy_in) / self.tournament.buy_in
  end
end
