class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin

  def index
    @admin = current_user
    @users = User.all 
    @events = Event.all
  end

end
