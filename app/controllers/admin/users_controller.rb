class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_is_admin

  def index
    @admin = current_user
    @users = User.all 
    @events = Event.all
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(post_params)
      redirect_to admin_root_path, notice: "L'utilisateur a bien été modifié !"
    else
      flash.now[:messages] = @user.errors.full_messages
      render :edit
    end
    
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path, notice: "L'utilisateur a bien été détruit !"
  end

  private

  def post_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :admin)
  end

end