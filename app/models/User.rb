class User
  #user puede ser usuario o correo
  attr_accessor :user, :password
  has_one :rol
end