class Schedule < ApplicationRecord
  belongs_to :branch_office
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :day,  presence: true, uniqueness: { scope: :branch_office_id, message: 'El día de la semana seleccionado ya fue agregado' }
  validates_comparison_of :end_time, greater_than_or_equal_to: :start_time
end