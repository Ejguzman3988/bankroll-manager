class TournamentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if params[:user_id]
            @user = current_user
            @tournaments = @user.games.select{|game| game.game_type_type == 'Tournament'}
        else
            @tournaments = Game.all.select{|game| game.game_type_type == 'Tournament'}
        end
    end

    def show
        @tournament = Tournament.find(params[:id])
    end
end
