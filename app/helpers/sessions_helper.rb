module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user != nil
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  private
  
  def authenticate_user
    redirect_to login_path, notice: "Please, log in." unless logged_in?
  end
  
  def registered_user
    redirect_to user_path(current_user) if logged_in?
  end
end