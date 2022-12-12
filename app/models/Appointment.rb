class Appointment < ApplicationRecord
  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_id_user, -> (user_id) { where user_id: user_id }
  enum :status, { pendiente: 'pendiente', cancelado: 'cancelado', atendido: 'atendido' }
  validates :date, presence: true
  validates :hour, presence: true
  validates :motive, presence: true
  validates :status, presence: true
  validate :status_atendido_description_result
  belongs_to :branch_office
  belongs_to :user

  def branch_office_name
    @branch_office_aux = BranchOffice.find_by(id: branch_office_id)
    @branch_office_aux.name
  end

  def bank_staff_name
    @appointment_staff = Appointment.find_by(id: id)
    @bank_staff_aux = User.find_by(id: @appointment_staff.bank_staff_id)
    @bank_staff_aux.name
  end

   private
  def status_atendido_description_result
    not (status == :atendido && description_result.nil?)
  end
  end