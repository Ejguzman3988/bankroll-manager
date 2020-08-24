class User < ApplicationRecord
  
  has_many :trackers
  has_many :tournaments, through: :trackers
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]
  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end 
  end

  def bankroll_buy_in
    self.bankroll/100
  end

end