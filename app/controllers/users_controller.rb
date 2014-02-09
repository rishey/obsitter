class UsersController < ApplicationController
  def index
    @error = session[:error]
    @users = User.all
  end

  def show
    if current_user
      if params[:id].to_i != current_user.id
        @error = "you can only view YOUR profile."
        render 'sessions/new'
      end
    else
      @error = "you need to be logged in to see your profile"
      render 'sessions/new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @signup_errors = @user.errors.full_messages
      render "sessions/new"
    end
  end

  def destroy
    User.destroy(current_user)
    session[:user_id] = nil
    redirect_to :root
  end

  def update
    if current_user.update(params[:user].permit(:username, :email, :password, :password_confirmation, :protect_tweets, :full_name, :web_site, :location, :bio))
      redirect_to current_user
    else
      @error = "error: check your input. not saved."
      render "edit"
    end
  end

 private

   def user_params
       params.require(:signup).permit(:username, :email, :password, :password_confirmation, :protect_tweets, :full_name, :web_site, :location, :bio)
   end

end
