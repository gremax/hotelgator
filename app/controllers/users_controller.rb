class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
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