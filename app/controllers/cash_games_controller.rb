class CashGamesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if params[:user_id]
            @user = current_user
            @cash_games = @user.cash_games
        else
            @cash_games = CashGame.all
        end
        
    end

    def show
        @cash_game = CashGame.find(params[:id])
    end
end
