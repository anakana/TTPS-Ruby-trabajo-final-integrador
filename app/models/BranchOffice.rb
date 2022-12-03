class BranchOffice
  attr_accessor :name, :direction, :phone
  has_many :schedules, dependent: :destroy
  has_many :BankStaffs

  def save
  end

  def delete
  end

  def edit
  end

  def get_branch
  end

  def get_all
  end
end