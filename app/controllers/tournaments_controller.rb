class TournamentsController < ApplicationController
    def index
        @user = User.find_by(id: params[:user_id])
        
        if @user
            @tournaments = @user.tournaments
        else
            @tournaments = Tournament.all
        end
    end
end
