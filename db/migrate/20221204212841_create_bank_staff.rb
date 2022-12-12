class CreateBankStaff < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_staffs do |t|
      t.belongs_to :branch_office, foreign_key: true
    end
  end
end
