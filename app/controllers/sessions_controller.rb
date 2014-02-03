class SessionsController < ApplicationController
  def new
    p session[:user_id]
    p current_user
  end

  def create
    p "RUDOLF"
    p params
    p user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      p session[:user_id] = user.id
      p "session id"
      p session[:user_id]
      redirect_to :root
    else
      @error = "Incorrect username or password"
      p @error
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
