class Appointment < ApplicationRecord
  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_id_user, -> (user_id) { where user_id: user_id }
  enum :status, { pendiente: 'pendiente', cancelado: 'cancelado', atendido: 'atendido' }
  validates :date, presence: true
  validates_comparison_of :date, greater_than_or_equal_to: DateTime.now.to_s(:db), message: 'La fecha y hora elegida deben ser mayor a la fecha y hora actual'
  validates :motive, presence: true
  validates :status, presence: true
  belongs_to :branch_office
  belongs_to :user
  validate :validate_date

  def branch_office_name
    @branch_office_aux = BranchOffice.find_by(id: branch_office_id)
    @branch_office_aux.name
  end

  def bank_staff_name
    @appointment_staff = Appointment.find_by(id: id)
    @bank_staff_aux = User.find_by(id: @appointment_staff.bank_staff_id)
    @bank_staff_aux.name
  end

  def validate_date
    @branch_office_aux = BranchOffice.find_by(id: branch_office_id)
    @schedules = @branch_office_aux.schedules
    @flag = false
      @schedules.each do |schedule|
        if schedule.day == date.strftime("%A")
          if date.strftime("%H:%M") > schedule.start_time.strftime("%H:%M") && date.strftime("%H:%M") < schedule.end_time.strftime("%H:%M")
            @flag = true
            break
          end
        end
      end
    unless @flag
      self.errors.add(:date,"El día y horario elegido no coincide con el horario de la sucursal")
    end
  end
end