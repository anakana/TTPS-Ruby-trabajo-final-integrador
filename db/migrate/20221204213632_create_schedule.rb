class CreateSchedule < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :branch_office, foreign_key: true
      t.string   "day"
      t.time "start_time"
      t.time "end_time"
    end
  end
end
