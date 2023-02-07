# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
rol_admin = Rol.create!(id: 1, name: "Administrador")
rol_bank_staff = Rol.create!(id: 2, name: "Personal Bancario")
rol_client = Rol.create!(id: 3, name: "Cliente")

sucursal_1 = BranchOffice.create({name: "sucursal_1", direction: "calle 7", phone: "2211111111"})
sucursal_2 = BranchOffice.create({name: "sucursal_2", direction: "calle 8", phone: "2212222222"})
sucursal_3 = BranchOffice.create({name: "sucursal_3", direction: "calle 9", phone: "2213333333"})
sucursal_4 = BranchOffice.create({name: "sucursal_4", direction: "calle 10", phone: "2214444444"})

user_admin = User.create({name:"admin",password:"admin", password_confirmation: "admin", rol_id: rol_admin.id })
user_staff = User.create({name:"staff",password:"staff", password_confirmation: "staff", rol_id: rol_bank_staff.id, branch_office_id: sucursal_1.id})
user_client = User.create({name:"client",password:"client", password_confirmation: "client", rol_id: rol_client.id })



horario_1 = Schedule.create({day:"Monday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 16:00:00",branch_office_id: sucursal_1.id})
horario_2 = Schedule.create({day:"Monday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 16:00:00",branch_office_id: sucursal_2.id})
horario_3 = Schedule.create({day:"Monday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 16:00:00",branch_office_id: sucursal_3.id})
horario_4 = Schedule.create({day:"Monday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 16:00:00",branch_office_id: sucursal_4.id})
horario_5 = Schedule.create({day:"Tuesday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 17:00:00",branch_office_id: sucursal_1.id})
horario_6 = Schedule.create({day:"Tuesday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 17:00:00",branch_office_id: sucursal_2.id})
horario_7 = Schedule.create({day:"Tuesday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 17:00:00",branch_office_id: sucursal_3.id})
horario_8 = Schedule.create({day:"Tuesday",start_time:"2000-01-01 09:00:00",end_time:"2000-01-01 17:00:00",branch_office_id: sucursal_4.id})
horario_9 = Schedule.create({day:"Wednesday",start_time:"2000-01-01 10:00:00",end_time:"2000-01-01 16:00:00",branch_office_id: sucursal_1.id})

turno_1 = Appointment.create!({motive:"motivo 1",date: "2022-12-07 00:00:00",hour:"2000-01-01 10:00:00",branch_office_id: sucursal_1.id, bank_staff_id: user_staff.id,user_id: user_client.id})
turno_2 = Appointment.create!({motive:"motivo 2",date: "2022-12-08 00:00:00",hour:"2000-01-01 10:00:00",branch_office_id: sucursal_1.id, bank_staff_id: user_staff.id,user_id: user_client.id})
turno_3 = Appointment.create!({motive:"motivo 3",date: "2022-12-09 00:00:00",hour:"2000-01-01 10:00:00",branch_office_id: sucursal_1.id, bank_staff_id: user_staff.id,user_id: user_client.id})
