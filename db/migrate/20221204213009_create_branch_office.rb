class CreateBranchOffice < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_offices do |t|
      t.string  "name"
      t.string  "direction"
      t.string  "phone"
    end
  end
end
