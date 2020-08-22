# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
(1..5).to_a.each do |num|
    User.create(name: "user#{num}", username: "test#{num}", password: "testtest", email: "test#{num}@email.com")
end

# Two poker sites
    #-- poker_site_id 1
PokerSite.create(name: "PokerStars", url: "www.pokerstars.com")
    #-- poker_site_id 2
PokerSite.create(name: "PartyPoker", url: "www.partypoker.com")
# ---

# Tournaments
(1..10).to_a.each do |num|
    Tournament.create(name: "Tournament ##{num}", buy_in: 1, start_date: DateTime.parse("09/01/2020 15:0#{num}"), poker_site_id: [1,2].sample)
end

# CashGames
(1..10).to_a.each do |num|
    CashGame.create(name: "Cash Game ##{num}", stake: "1/2", max_players: 9, buy_in: 200, poker_site_id: [1,2].sample)
end

# Games

(1..10).to_a.each do |num|
    Game.create(user_id: (1..5).to_a.sample, poker_site_id: [1,2].sample, name: ['NLH', 'PLO', 'STUD'].sample, game_type_id: (1..10).to_a.sample, game_type_type: ["Tournament", "CashGame"].sample)
end



