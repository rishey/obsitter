class BlurtsController < ApplicationController
  def index
    @error = session[:error]
    session[:error]= nil
    @blurts = Blurt.all.reverse
  end

  def show
    @blurt = Blurt.find(params[:id])
    @user = User.find(current_user.id)
  end

  def show4user
    @blurts = Blurt.where(user_id: params[:id]).reverse
    @user = User.find(params[:id])
  end

  def new
    if logged_in?
      @blurt = Blurt.new
      @blurt.user_id = current_user.id
    else
      session[:error] = "You need to be logged in to blurt."
      redirect_to blurts_path
    end
  end

  def create
    @blurt = Blurt.new(blurt_params)
    respond_to do |format|
      if @blurt.save
        format.html { redirect_to @blurt, notice: 'blurt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blurt }
      else
        format.html { render action: 'new' }
        format.json { render json: @blurt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def update
  end

 private

   def blurt_params
       params.require(:blurt).permit(:body, :user_id)
   end

end
