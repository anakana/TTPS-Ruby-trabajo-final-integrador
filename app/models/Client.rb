class Client < Rol
  has_many :appointments
  has_many :BankStaffs, through: :appointments
end