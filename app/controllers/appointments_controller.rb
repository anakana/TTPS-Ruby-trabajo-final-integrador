class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @appointments = Appointment.where(nil)
    @appointments = @appointments.filter_by_status(:pendiente)
    @appointments = @appointments.filter_by_id_user(Current.user.id)
    @branch_offices = BranchOffice.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    @branch_offices = BranchOffice.all
    @appointment.errors.full_messages.each do |msg|
      flash[:error] = msg
    end
  end

  def management
    @user = User.find_by(id: Current.user.id)
    @appointments_branch_id = Appointment.where(branch_office_id: @user.branch_office_id)
    @appointments = []
    @appointments_branch_id.each do |appointment|
      if appointment.valid?
        @appointments << appointment
      end
    end
  end

  def history
    @appointments = Appointment.all
    @appointments = @appointments.filter_by_id_user(Current.user.id)
    @history = []
    @appointments.each do |appointment|
      if appointment.cancelado? == false
        @history << appointment
      end
    end
  end

  def new
    @appointment = Appointment.new
    @branch_offices = BranchOffice.all
  end

  def create
    @branch_office_id = params[:branch_office_id]
    @branch_office = BranchOffice.find_by(id: @branch_office_id)
    @commit = params[:commit]

    if @commit == "Crear turno"
      @client = User.find_by(id: Current.user.id)
      @branch_office_id = params[:appointment][:branch_office_id]
      @branch_office = BranchOffice.find_by(id: @branch_office_id)
      @appointment = @branch_office.appointments.build(appointment_params)
      @appointment.user_id = Current.user.id

      if @appointment.save
        redirect_to @appointment, notice:"Turno Solicitado creado correctamente"
      else
        @appointment.errors.full_messages.each do |msg|
          flash[:error] = msg
        end
        render :create, status: :unprocessable_entity
      end
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    if params[:branch_office_id]!=nil
      @branch_office_id = params[:branch_office_id]
    else
      @branch_office_id = @appointment.branch_office_id
    end
    @branch_office = BranchOffice.find_by(id: @branch_office_id)

  end

  def update
    @appointment = Appointment.find(params[:id])
    @branch_office_id = params[:branch_office_id]
    @branch_office = BranchOffice.find_by(id: @branch_office_id)
    @update = params[:appointment]
    if @update != nil
      @appointment = Appointment.find(params[:id])
      if @appointment.update(appointment_params)
        redirect_to @appointment
      else
        @appointment.errors.full_messages.each do |msg|
          flash[:error] = msg
        end
        redirect_to @appointment
      end
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
      @appointment.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
      render :edit, status: :unprocessable_entity
    end
  end

  def attend
    @appointment = Appointment.find(params[:id])
    @user = User.find_by(id: Current.user.id)
    @description = params[:appointment][:description_result]

    if @appointment.branch_office_id == @user.branch_office_id && @description != ""
      if @appointment.update(status: :atendido,bank_staff_id: Current.user.id,description_result: @description)
        @appointment.errors.full_messages.each do |msg|
          flash[:error] = msg
        end
        redirect_to @appointment
      else
        @appointment.errors.full_messages.each do |msg|
          flash[:error] = msg
        end
        render :show, status: :unprocessable_entity
      end
    else
      @appointment.errors.full_messages.each do |msg|
        flash[:error] = msg
      end

      flash[:error] = "Error: Revisar que el comentario de descripción final no este vacio o revisar que la sucursal corresponda"
      render :show, status: :unprocessable_entity
    end
    @appointment.errors.full_messages.each do |msg|
      flash[:error] = msg
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date,:motive,:description_result,:user_id,:branch_office_id, :bank_staff_id)
  end
end