class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end

  
  def edit   
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.messages
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :bankroll)
    end
end
