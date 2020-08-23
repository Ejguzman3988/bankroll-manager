class CashGamesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if params[:user_id]
            @user = current_user
            @cash_games = @user.games.select{|game| game.game_type_type == 'CashGame'}
        else
            @cash_games = Game.all.select{|game| game.game_type_type == 'CashGame'}.uniq{|obj| obj.game_type_id}
        end
        
    end

    def show
        @cash_game = CashGame.find(params[:id])
    end
end
