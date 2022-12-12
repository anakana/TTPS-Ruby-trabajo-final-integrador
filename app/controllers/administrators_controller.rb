class AdministratorsController < ApplicationController

  def new
    @administrator = Administrator.new
  end

  def create
    @branch_office_id = params[:administrator][:branch_office_id]
    @client_id = params[:administrator][:branch_office_id]

    @rol = Rol.find_by(id: 1)
    @administrator = @rol.users.create(administrator_params)
    if not @administrator.nil?
      redirect_to root_path, notice:"Usuario Administrador creado correctamente"
    else
      render :new
    end
  end

  private
  def administrator_params
    params.require(:administrator).permit(:name,:password,:password_confirmation, :rol_id)
  end
end
