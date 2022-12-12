class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @rol = Rol.find_by(id: 3)
    @user = @rol.users.create(user_params)
    if not @user.id.nil?
      session[:user_id] = @user.id
      redirect_to root_path, notice:"Usuario creado correctamente"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end