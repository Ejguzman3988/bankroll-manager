class TournamentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = User.find_by(id: params[:user_id])
        
        if @user
            @tournaments = @user.tournaments
        else
            @tournaments = Tournament.all
        end
    end

    def new
        @tournament = Tournament.new
    end

    def create
        @tournament = Tournament.new(tournament_params)
        if @tournament.save
            user = current_user

            user.tournaments << @tournament
            #user.update_bankroll(@tournament)
            user.save

            redirect_to user_path(user) 
        else
            flash[:notice] = @tournament.errors.full_messages
        end
    end

    private
        def tournament_params
            params.require(:tournament).permit(:name, :buy_in)
        end
end
