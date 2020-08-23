class GamesController < ApplicationController
    def new
        @game = current_user.games.build
    end

    def create
        @game = current_user.games.build(game_params)
        if @game.save
            flash[:alert] = ["game has been added to your schedule"]
            current_user.update_bankroll(@game)
            flash[:alert] << ["Bankroll has been updated."]

            redirect_to user_path(current_user)
        else
            flash[:alert] = @game.errors.full_messages
            render :new
        end
    end

    private
        def game_params
            params.require(:game).permit(:name, :won, :game_type_id, :game_type_type)
        end

end
