class BranchOffice < ApplicationRecord
  validates :name, presence: true, uniqueness: { message: 'El nombre de sucursal ya existe, debe ser unico'}
  validates :direction, presence: true
  validates :phone, presence: true,
            numericality: { message: 'El nro de telef debe contener solo digitos'},
            length: { minimum: 10, maximum: 15, message: 'El nro de telef debe tener min 10 digitos y max 15' }

  has_many :schedules, dependent: :destroy
  has_many :bank_staffs
  has_many :appointments

end