class BlurtsController < ApplicationController
  def index
    @blurts = Blurt.all
  end

  def show

  end


  def new
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
