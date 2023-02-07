class User < ApplicationRecord
  has_secure_password
  scope :filter_by_id_rol, -> (id_rol) { where rol_id: id_rol }
  #users puede ser usuario o correo
  validates :name, presence: true, uniqueness: { message: 'El nombre de usuario o mail ya existe'}
  validates :password_digest, presence: true
  belongs_to :rol
  has_many :appointments

  def has_permission(rol_name)
    rol = Rol.find_by(name: rol_name)
    rol_id == rol.id
  end

  def same_branch_office_id(appointment_branch_office_id)
    puts "VALIDAR IGUAL BRANCH ID"
    puts branch_office_id == appointment_branch_office_id
    branch_office_id == appointment_branch_office_id
  end

  def get_appointments
    appointments
  end
end