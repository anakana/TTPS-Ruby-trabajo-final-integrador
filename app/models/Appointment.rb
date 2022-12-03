class Appointment < ActiveRecord::Base
  attr_accessor :date, :hour, :motive, :state, :description_result
  #has_one :branchOffice
  belongs_to :Client
  belongs_to :BankStaff

  def attend
  end

  def reserve
  end

end