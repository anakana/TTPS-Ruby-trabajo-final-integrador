class BankStaffsController < ApplicationController
  def new
    @bank_staff = BankStaff.new
  end

  def create
    #params[:bank_staff][:email]
    @branch_office = BranchOffice.find_by(id: params[:bank_staff][:branch_office_id])
    @rol = Rol.find_by(id: 2)
    @bank_staff = @branch_office.bank_staffs.build(bank_staff_params)
    @bank_staff.rol = @rol

    if @bank_staff.save
       redirect_to root_path, notice:"Usuario Personal Bancario creado correctamente"
    else
      render :new
    end
  end

  private
  def bank_staff_params
    params.require(:bank_staff).permit(:name,:password,:password_confirmation,:branch_office_id,:rol_id)
  end
end