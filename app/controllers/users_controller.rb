class UsersController < ApplicationController
  before_action :registered_user, only: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome to Hotelgator, #{@user.name}!"
    else
      flash.now[:alert] = "You have some errors!"
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                                :password_confirmation)
  end
end