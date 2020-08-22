class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    
    def show
        @user = current_user
    end
end
