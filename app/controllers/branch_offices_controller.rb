class BranchOfficesController < ApplicationController

  def index
    @branch_offices = BranchOffice.all
  end

  def show
    @branch_office = BranchOffice.find(params[:id])
  end

  def new
    @branch_office = BranchOffice.new
  end

  def create
    @branch_office = BranchOffice.new(branch_office_params)
    if @branch_office.save
      redirect_to @branch_office, notice: "Se ha creado la sucursal correctamente"
    else
      render :new
    end
  end

  def edit
    @branch_office = BranchOffice.find(params[:id])
  end

  def update
    @branch_office = BranchOffice.find(params[:id])
    if @branch_office.update(branch_office_params)
      redirect_to @branch_office
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @branch_office = BranchOffice.find(params[:id])
    @branch_office.destroy
    redirect_to root_path, notice: "Se ha eliminado la sucursal correctamente"
  end

  private
  def branch_office_params
    params.require(:branch_office).permit(:name,:direction,:phone, schedules_attributes: [:id, :start_time,:end_time,:day, :branch_office_id])
  end
end