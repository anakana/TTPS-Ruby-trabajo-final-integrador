class CreateAppointment < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :branch_office, foreign_key: true
      t.integer "bank_staff_id", foreign_key: true
      t.string  "motive"
      t.string  "status", default: 'pendiente'
      t.datetime "date"
      t.time "hour"
      t.string  "description_result"
    end
  end
end
