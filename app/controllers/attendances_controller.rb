class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
  end

  def index
    @attendances = Attendance.all
    @event = Event.find(params[:event_id])  
  end

  def create
    @user=current_user
    @event= Event.find(params[:event_id])
    @amount = @event.price
    
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount*100,
      description: @event.title,
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance(@event.id)
    end
    Attendance.create(stripe_customer:params[:stripeToken],user_id:@user.id,event_id:@event.id)
  end

end
