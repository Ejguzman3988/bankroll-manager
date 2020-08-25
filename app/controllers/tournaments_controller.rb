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
            user.update_bankroll(@tournament, tracker_params[:won])
            redirect_to user_path(user) 
        else
            flash[:notice] = @tournament.errors.full_messages
            @tournament = Tournament.find_by(name: tournament_params[:name])
            render :new
        end
    end


    def show
        @tournament = Tournament.find(params[:id])
    end

    def update
        user = current_user
        tournament_params[:winnings].each do |key, value|
            tourney = Tournament.find(key)
            Tracker.tourney_user(tourney, user).each{|t| t.winnings = BigDecimal(0); t.save}
            last_tracker = Tracker.tourney_user(tourney, user).last
            last_tracker.winnings = value
            user.update_bankroll(tourney, value)
            last_tracker.save
        end
        redirect_to user_path(user)
    end

    def destroy
        user = User.find(params[:user_id])
        tourney = Tournament.find(params[:id])
        if user == current_user
            Tracker.tourney_user(tourney, user).each do |t|
                user.bankroll += tourney.buy_in
                user.bankroll -= t.winnings
                user.save
                t.destroy
                
                if tourney.trackers.empty?
                    tourney.destroy
                end
            end
        end
        redirect_to user_path(user)
    end

    private
        def tournament_params
            params.require(:tournament).permit(:name, :buy_in, winnings: {})
        end
        
        def tracker_params
            params.require(:tracker).permit(:won)
        end
end
