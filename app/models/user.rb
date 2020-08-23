class User < ApplicationRecord
  
  has_many :games
  has_many :poker_sites, through: :games
  has_many :tournaments, through: :games, source: :game_type, source_type: "Tournament"
  has_many :cash_games, through: :games, source: :game_type, source_type: "CashGame"
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

  def update_bankroll(game)
    cost = game.game_type.buy_in
    income = game.won
    profit = income - cost
    self.bankroll += profit
  end
end
