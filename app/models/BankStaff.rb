class BankStaff < User
  attr_accessor :branch_office_id
  validates :branch_office_id, presence: true
  belongs_to :branch_office
end