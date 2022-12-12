class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def client
    @users_client = User.where(nil)
    @users_client = @users_client.filter_by_id_rol(3)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Se ha eliminado el turno correctamente"
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end