module SessionsHelper
  def current_user
    if session[:id]
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end


  def logged_in?
    !current_user.nil?
  end

end