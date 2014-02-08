class BlurtsController < ApplicationController
  def index
    @error = session[:error]
    session[:error]= nil
    @blurts = Blurt.all
  end

  def show

  end


  def new
    if logged_in?
      # renders new blurt by default
    else
      session[:error] = "You need to be logged in to blurt."
      redirect_to blurts_path
    end
  end

  def create
  end

  def destroy
  end

  def update
  end

 private

   def user_params
       params.require(:blurt).permit(:body, :user_id)
   end

end
