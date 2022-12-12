class Client < User
  has_many :appointments
  has_many :bankStaffs, through: :appointments
end