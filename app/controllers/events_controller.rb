class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :is_admin?, except:[:index,:new,:create,:show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    p "$"*60
    p params
    @event = Event.new(title:params[:title],description:params[:description],admin_id:current_user.id,duration:params[:duration],location:params[:location],price:params[:price],start_date:params[:start_date].to_datetime)
    p @event
    if @event.save
      redirect_to root_path, notice: "L'évènement '#{@event.title.capitalize}' a bien été créé ! Félicitation"
    else
      flash.now[:messages] = @event.errors.full_messages
      render new_event_path
    end
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(post_params)
      redirect_to event_path(params[:id]), notice: "L'évènement a bien été modifié !"
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
    redirect_to root_path, notice: "L'évènement a bien été détruit !"
  end

  private

  def is_admin?
    unless current_user.id == Event.find(params[:id]).admin.id
      flash[:danger] = "Vous n'êtes pas le créateur de cet évènement....Si oui, prouvez le"
      redirect_to root_path
    end
  end

  def post_params
    params.require(:event).permit(:title,:description,:duration,:location,:price,:start_date)
  end

end