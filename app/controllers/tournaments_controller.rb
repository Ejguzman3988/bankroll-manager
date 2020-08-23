class TournamentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if params[:user_id]
            @user = current_user
            @tournaments = @user.tournaments
        else
            @tournaments = Tournament.all
        end
    end

    def show
        @tournament = Tournament.find(params[:id])
    end

    def new
        @tournament = current_user.tournaments.build
    end

    def create
        @tournament = current_user.tournaments.build(tournament_params)
        if @tournament.save
            
        else
            flash[:alert] = @tournament.errors.full_messages
            render :new
        end
        
    end

    private
        def tournament_params
            Game.create(name: params[:tournament][:poker_type], )
            params.require(:tournament).permit(:name, :start_date, :end_date, :late_reg, :status, :buy_in, :poker_site_id)
        end
end
