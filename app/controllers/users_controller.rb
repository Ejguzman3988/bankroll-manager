class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    redirect_to new_user_session_path
  end
  
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
      @user = User.find_by(id: params[:id])
      if @user.nil?
        redirect_to new_user_session_path
      end
    end

    def user_params
      params.require(:user).permit(:name, :bankroll, :email, :password, :password_confirmation)
    end
end
