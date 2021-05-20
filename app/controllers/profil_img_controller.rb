class ProfilImgController < ApplicationController

  def create
    @user=User.find(params[:user_id])
    @user.profil_img.attach(params[:profil_img])
    redirect_to(user_path(@user)) 
  end

end
