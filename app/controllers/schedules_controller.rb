class SchedulesController < ApplicationController

  def create
    @branch_office = BranchOffice.find(params[:branch_office_id])
    @schedule = @branch_office.schedules.create(schedule_params)
    if not @schedule.id.nil?
      redirect_to branch_office_path(@branch_office), notice: "Se ha creado el horario correctamente"
    else
      redirect_to branch_office_path(@branch_office), alert: "No se creo el horario, día ya existente u horario incorrecto"
    end
  end

  def edit
    @schedule = Schedule.find(params[:branch_office_id])
  end

  def update
    @branch_office = BranchOffice.find(params[:id])
    @schedule = Schedule.find(params[:branch_office_id])
    if @schedule.update(schedule_params)
      redirect_to branch_office_path(@branch_office), notice: "Se ha actualizado el horario correctamente"
    else
      redirect_to branch_office_path(@branch_office), alert: "No se actualizo el horario, día ya existente u horario incorrecto"
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:day,:start_time,:end_time)
  end
end