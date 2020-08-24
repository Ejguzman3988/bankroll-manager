class TournamentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = User.find_by(id: params[:user_id])
        
        if @user
            @tournaments = Tournament.user_tourneys(@user.id)
        else
            @tournaments = Tournament.all
        end
    end

    def new
        @tournament = Tournament.new
    end

    def create
        
        @tournament = Tournament.find_by(tournament_params)
        
        if @tournament.nil?
            @tournament = Tournament.new(tournament_params) 
        end

        if @tournament.save
            user = current_user

            user.tournaments << @tournament
            user.update_bankroll(@tournament)

            redirect_to user_path(user) 
        else
            flash[:notice] = @tournament.errors.full_messages
            render :new
        end
    end

    def show
        @tournament = Tournament.find(params[:id])
    end

    private
        def tournament_params
            params.require(:tournament).permit(:name, :buy_in)
        end
end
