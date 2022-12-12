class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(nil)
    @appointments = @appointments.filter_by_status(:pendiente)
    @appointments = @appointments.filter_by_id_user(Current.user.id)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def management
  end

  def history
    @history = Appointment.all
    @history = @history.filter_by_id_user(Current.user.id)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    if Current.user.has_permission("Cliente")

      @branch_office_id = params[:appointment][:branch_office_id]
      @branch_office = BranchOffice.find_by(id: @branch_office_id)
      @client = User.find_by(id: Current.user.id)

      @appointment = @branch_office.appointments.build(appointment_params)
      @appointment.user_id = Current.user.id
      if @appointment.save
        redirect_to root_path, notice:"Turno Solicitado creado correctamente"
      else
        render :new
      end
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to root_path, notice: "Se ha eliminado el turno correctamente"
  end

  def cancel
    @appointment = Appointment.find(params[:id])
    if @appointment.update(status: :cancelado)
      redirect_to @appointment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def attend
    @appointment = Appointment.find(params[:id])
    @user = User.find_by(id: Current.user.id)
    if @appointment.branch_office_id == @user.branch_office_id

      if @appointment.update(status: :atendido,bank_staff_id: Current.user.id,description_result: params[:description_result])
        redirect_to @appointment
      else
        render :edit, status: :unprocessable_entity
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date,:hour,:motive,:description_result,:user_id,:branch_office_id, :bank_staff_id)
  end

end