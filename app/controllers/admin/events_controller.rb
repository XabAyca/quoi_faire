class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin

  def index
    @admin = current_user
    @users = User.all 
    @events = Event.all
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(post_params)
      redirect_to admin_root_path, notice: "L'évènement a bien été modifié !"
    else
      flash.now[:messages] = @event.errors.full_messages
      render :edit
    end
    
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_root_path, notice: "L'évènement a bien été détruit !"
  end

  private

  def post_params
    params.require(:event).permit(:title,:description,:duration,:location,:price,:start_date,:avatar)
  end

end
