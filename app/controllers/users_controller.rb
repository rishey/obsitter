class UsersController < ApplicationController
  def index
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
  end



 private

   def user_params
       params.require(:signup).permit(:username, :email, :password, :password_confirmation, :protect_tweets, :full_name, :web_site, :bio)
   end

end
