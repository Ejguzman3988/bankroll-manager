class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find(params[:id])
        @tournaments = @user.games.select{|game| game.game_type_type == 'Tournament'}
        @cash_games = @user.games.select{|game| game.game_type_type == 'CashGame'}
    end
end
